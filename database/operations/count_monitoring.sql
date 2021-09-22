USE 
	Landingzone_Prod
GO

SELECT 'fakt_servicekennzahlen' as tablename, count(1) as cnt FROM [dtm_eng].[fakt_servicekennzahlen] 
UNION ALL
SELECT 'dim_kunde' as tablename, count(1) as cnt FROM [dtm_eng].[dim_kunde]
UNION ALL
SELECT 'tmp_kunden_bindung_de' as tablename, count(1) as cnt FROM [bdv].[tmp_kunden_bindung_de]
UNION ALL
SELECT 'tmp_kunden_bindung_at' as tablename, count(1) as cnt FROM [bdv].[tmp_kunden_bindung_at]

USE 
	Landingzone_Entw
GO

SELECT 'fakt_servicekennzahlen' as tablename, count(1) as cnt FROM [dtm_eng].[fakt_servicekennzahlen] 
UNION ALL
SELECT 'dim_kunde' as tablename, count(1) as cnt FROM [dtm_eng].[dim_kunde]
UNION ALL
SELECT 'tmp_kunden_bindung_de' as tablename, count(1) as cnt FROM [bdv].[tmp_kunden_bindung_de]
UNION ALL
SELECT 'tmp_kunden_bindung_at' as tablename, count(1) as cnt FROM [bdv].[tmp_kunden_bindung_at]
