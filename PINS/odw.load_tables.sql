drop table if exists odw.load_tables

select 	T2.name as 'SchemaName', 
		T1.name as 'TableName',
		'odw-raw' as 'LandingContainer',
		T3.LandingFolder as 'LandingFolder',
		T1.name as 'Filename'
into odw.load_tables
from sys.tables T1	inner join sys.schemas T2 on T1.schema_id = T2.schema_id
					inner join odw.tableLandingFldMapping T3 on T1.name=T3.TableName

where (T1.name like 'Fact%' or T1.name like 'Dim%')
	and T2.name = 'live'
	and t1.name not like '%X'
	and t1.name not like '%ZZZ'
	and t1.name not like '%[0-9]'

union all

select 	T2.name as 'SchemaName', 
		T1.name as 'TableName',
		'odw-raw' as 'LandingContainer',
		T3.LandingFolder as 'LandingFolder',
		T1.name as 'Filename'

from sys.views T1	inner join sys.schemas T2 on T1.schema_id = T2.schema_id
					inner join odw.tableLandingFldMapping T3 on T1.name=T3.TableName

where T2.name = 'PBI'
	and t1.name not like '%X'
	and t1.name not like '%ZZZ'
	and t1.name not like '%[0-9]'

--select replace(syscolumns.name,' ','')
--from sysobjects
--join syscolumns on sysobjects.id = syscolumns.id
--where sysobjects.name = 'vw_AppealDetail'


