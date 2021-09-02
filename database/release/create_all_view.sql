
/****** Object:  Views  ******/
DROP VIEW [dtm_eng].[v_dim_kunde]
GO

DROP VIEW [dtm_eng].[v_dim_kunde]
GO
--Erweiterung dim_kunde mit Storno-Attribute aus fakt_servicekennzahlen, gehören eigentlich da rein, werden in den Reports zu den Abrechnungen gebraucht
CREATE VIEW [dtm_eng].[v_dim_kunde] AS
SELECT dk.*, fk.mkm_storno, fk.storno_dt
from [dtm_eng].[dim_kunde] dk
	  join dtm_eng.fakt_servicekennzahlen fk
	  on dk.hub_kunde_hk = fk.hub_kunde_hk

GO

DROP VIEW [dtm_eng].[v_fakt_servicekennzahlen]
GO

CREATE VIEW [dtm_eng].[v_fakt_servicekennzahlen] AS
SELECT * FROM [dtm_eng].[fakt_servicekennzahlen];
GO

DROP VIEW [dtm_eng].[v_fakt_abrechnungen]
GO

CREATE VIEW [dtm_eng].[v_fakt_abrechnungen] AS
SELECT a.*
FROM [dtm_eng].[fakt_abrechnungen] a;
GO

DROP VIEW stg_spa.v_buchung
GO

CREATE VIEW stg_spa.v_buchung
AS
SELECT h.*
	--, e.erfasst_am
FROM stg_spa.buchung h
--JOIN stg_spa.buchung_test e
--	ON e.b_id = h.b_id
--	AND e.record_source = h.record_source
<<<<<<< HEAD
=======

DROP VIEW [dtm_eng].[v_fakt_debitorenbuchungen]
GO

CREATE VIEW [dtm_eng].[v_fakt_debitorenbuchungen] AS
SELECT a.*
FROM [dtm_eng].[fakt_debitorenbuchungen] a;
GO

DROP VIEW [dtm_eng].[v_dim_debitorenbuchungen]
GO

CREATE VIEW [dtm_eng].[v_dim_debitorenbuchungen] AS
SELECT a.*
FROM [dtm_eng].[dim_debitorenbuchungen] a;
GO
>>>>>>> feature/debitorenbuchungen
