DECLARE @schema_name 	VARCHAR(100) = 'dtm_eng',
		@table_name 	VARCHAR(100) = 'dim_kunde'

DELETE FROM mtd.job_generic_control 
WHERE schema_name = @schema_name
  AND table_name = @table_name

INSERT INTO mtd.job_generic_control 
 (schema_name,table_name,version,active_ind,sort_order,sql_1,sql_2,sql_3,sql_4,sql_5,
  branch_nbr,production_start_dt,source_system,source_type,remark,changed_dts,changed_by)
SELECT 
@schema_name,
@table_name,
'1.3',
1,
10,
'truncate table dtm_eng.dim_kunde;','
/* v.1.3 20210624 TODO Mahnkuendigungdauer */
INSERT INTO dtm_eng.dim_kunde
           (hub_kunde_hk
           ,kunde_id
           ,mandant_id
           ,delete_ind
           ,import_am_dt
           ,liefern_ab_dt
           ,vertragsende_dt
           ,wunschtermin_dt
           ,datum_einzug_dt
           ,abschlagsmit_am_dt
           ,frei_zum_dt
           ,sondervertragskunde_ind
           ,bemerkung_kuendigung
           ,storno_ind
		   ,verbrauch_akt
		   ,vertragsende_gesetzt_dt)
SELECT 
	hub_k.hub_kunde_hk,
	hub_k.kunde_id,
	--hub_k.record_source,
	CASE WHEN map_mandant.mandant_id IS NULL THEN -1 ELSE map_mandant.mandant_id END AS mandant_id,
	hsat_k.delete_ind,
	hsat_k.import_am_dt,
	hsat_k.liefern_ab_dt,
	hsat_k.vertragsende_dt, 
	hsat_k.wunschtermin_dt,
	hsat_k.datum_einzug_dt, 
	CASE 
		WHEN hsat_k.abschlagsmit_am_dt = ''00.00.0000'' THEN  NULL 
		WHEN CAST(substring(hsat_k.abschlagsmit_am_dt,7,4) as integer) not between 1900 and 9999 THEN CONVERT(date,''1900-01-01'') 
		ELSE CONVERT(date, CONCAT(CAST(substring(hsat_k.abschlagsmit_am_dt,7,4) as nvarchar),N''-'',
								  CAST(substring(hsat_k.abschlagsmit_am_dt,4,2) as nvarchar),N''-'',
								  CAST(substring(hsat_k.abschlagsmit_am_dt,1,2) as nvarchar))) 
	END AS abschlagsmit_am_dt,
	hsat_k.frei_zum_dt,
	hsat_k.sondervertragskunde_ind,
	hsat_k.bemerkung_kuendigung,
	case when hsat_k.storno_ind = 1 then ''Ja'' else ''Nein'' end AS storno_ind,
	flkt_k.verbrauch_akt,
	flkt_k.vertragsende_gesetzt_dt
FROM
	rdv.hub_kunde hub_k
	JOIN (SELECT hub_kunde_hk, max(load_cycle_seq) as max_load_cycle_seq 
		  FROM rdv.hsat_kunde
		  GROUP BY hub_kunde_hk
		  ) max_sat 
		ON max_sat.hub_kunde_hk = hub_k.hub_kunde_hk
	JOIN rdv.hsat_kunde hsat_k
		ON hub_k.hub_kunde_hk = hsat_k.hub_kunde_hk
		   AND max_sat.max_load_cycle_seq = hsat_k.load_cycle_seq
	LEFT JOIN bdv.tmp_kunden_fluktuation flkt_k
		ON hub_k.hub_kunde_hk = flkt_k.hub_kunde_hk
	LEFT JOIN bdv.ref_mandant map_mandant
		ON SUBSTRING(hub_k.record_source,1,3) = map_mandant.mandant_code
',
null,
null,
null,
'branch',
null,
'DWH',
'insert',
'request for 1.x',
GETDATE(),
'BI Admin'

