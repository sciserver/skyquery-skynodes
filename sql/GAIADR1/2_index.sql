CREATE NONCLUSTERED INDEX [IX_Source_Zone] ON [dbo].[Source]
(
	[dec] ASC
)
INCLUDE
(
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SOURCEIDX]
GO

CREATE NONCLUSTERED INDEX [IX_Source_ZoneID] ON [dbo].[Source] 
(
	[zoneid] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SOURCEIDX]
GO

-- HTM index
CREATE NONCLUSTERED INDEX [IX_Source_HtmID] ON [dbo].[Source] 
(
	[htmid] ASC
)
INCLUDE
(
	[ra],
	[dec],
	[cx],
	[cy],
	[cz],
	[zoneID]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [SOURCEIDX]
GO

