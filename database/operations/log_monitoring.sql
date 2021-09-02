/*
	***** Load Log Monitoring  *****

	Load exec files are here: C:\DWH\ssh_dwh\etl\run_dwh_load

	Job name - a compound of steps (ctl.wht_jobs)
	Step name - is a stored procedure performing 1 task (ctl.wht_steps)
	Step current, cnt - is number of steps in a job. After running a Load, a job and steps entries in the log below, are created
	Comment - is the status
	Start and end dates - entered while job/steps running. In current setup zou need to open and clode STG LOAD CYCLE manually !!
	Duration - calc column in seconds
	Result - finished OK when 0, ehrn 1 then error.
	Error - columns get error messages handled by each step (sp)
*/

--- Prod ---
SELECT TOP (100) * FROM [Landingzone_Prod].[ctl].[wht_jobs_log] order by [start_dttm] desc

SELECT TOP (1000) * FROM [Landingzone_Prod].[ctl].[wht_steps_log] order by [start_dttm] desc

SELECT TOP (100) * FROM [Landingzone_Prod].[ctl].[wht_loads_log] order by load_start_dttm desc

/*
--- Entw ---
SELECT TOP (100) * FROM [Landingzone_Entw].[ctl].[wht_jobs_log] order by [start_dttm] desc

SELECT TOP (1000) * FROM [Landingzone_Entw].[ctl].[wht_steps_log] order by [start_dttm] desc

SELECT TOP (100) * FROM [Landingzone_Entw].[ctl].[wht_loads_log] order by load_start_dttm desc
*/
