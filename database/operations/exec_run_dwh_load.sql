USE [Landingzone_Entw]
GO

DECLARE	@loadcycle int = 0,
		@outputParameter nvarchar(100)
DECLARE	@return_value int

/* ----------- STAGING -----------


EXEC	@return_value = ctl.load_cycle_open 'stg_spa', @load_cycle = @loadcycle OUTPUT
SELECT	'Open Staging Load Cycle' = @loadcycle

	EXEC @return_value = [stg_spa].[sp_insert_landing_stg_spa] @mandant = 'MXG' --@mandant as record_source ins the step --[stg_spa].[sp_insert_landing_stg_spa]

EXEC	@return_value = ctl.load_cycle_finish 'stg_spa'
SELECT	'Finish Staging Load Cycle' = @loadcycle
 */
/* ----------- RDV -----------   */

EXEC	@return_value = ctl.load_cycle_open 'rdv', @load_cycle = @loadcycle OUTPUT
SELECT	'Open RDV Load Cycle' = @loadcycle

	EXEC	@return_value = ctl.whs_run_job 'LOAD_RDV_HUB'
	SELECT	'Return Value LOAD_RDV_HUB' = @return_value
	
	EXEC	@return_value = ctl.whs_run_job 'LOAD_RDV_HSAT' 
	SELECT	'Return Value LOAD_RDV_HSAT' = @return_value

	EXEC	@return_value = ctl.whs_run_job 'LOAD_RDV_LNK'
	SELECT	'Return Value LOAD_RDV_LNK' = @return_value

	EXEC	@return_value = ctl.whs_run_job 'LOAD_RDV_LSAT'
	SELECT	'Return Value LOAD_RDV_LSAT' = @return_value

	EXEC	@return_value = ctl.whs_run_job 'LOAD_RDV_REF'
	SELECT	'Return Value LOAD_RDV_REF' = @return_value

EXEC	@return_value = ctl.load_cycle_finish 'rdv'
SELECT	'Finish RDV Load Cycle' = @loadcycle


/* ----------- BDV -----------   
	
EXEC	@return_value = ctl.load_cycle_open 'bdv', @load_cycle = @loadcycle OUTPUT
SELECT	'Open BDV Load Cycle' = @loadcycle

	EXEC	@return_value = [mtd].[master_gen_sp_exec_jc] 1, --execute sqls in job control
			@outputParameter OUTPUT

	SELECT	'Return Value', @return_value UNION
	SELECT 'Output Parameter', CONVERT(nvarchar(100),@outputParameter)

EXEC	@return_value = ctl.load_cycle_finish 'bdv'
SELECT	'Finish BDV Load Cycle' = @loadcycle
*/
GO
