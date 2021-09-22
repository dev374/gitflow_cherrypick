
/* 
	TRUNCATE TABLE ctl.wht_steps
	TRUNCATE TABLE ctl.wht_jobs
*/


INSERT INTO ctl.wht_jobs 
			(job_name
			,layer
			,job_description
			,active)
     VALUES
			('LOAD_STG_LANDING','stg_spa','Stage Sherpa steps',1),
			('LOAD_RDV_REF','rdv','Ref data (calendar) reload',1),
			('LOAD_RDV_HUB','rdv','Loads hub tables from metadata',1),
			('LOAD_RDV_HSAT','rdv','Loads hub sat tables from metadata',1),
			('LOAD_RDV_LNK','rdv','Loads link tables from metadata',1),
			('LOAD_RDV_LSAT','rdv','Loads link sat tables from metadata',1),
			('LOAD_RDV_LSAT_STATUS','rdv','Loads link sat tables from metadata',0),
			('LOAD_BDV_ALL','bdv','Loads bdv from rdv',0)



