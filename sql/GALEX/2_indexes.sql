CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_Zone] ON [dbo].[PhotoObjAll] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PHOTOIDX]
GO


-- HTM index
CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_HtmID] ON [dbo].[PhotoObjAll] 
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
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PHOTOIDX]
GO

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_ZoneID] ON [dbo].[PhotoObjAll] 
(
	[ZoneID] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],
	[cx],
	[cy],
	[cz],
	[htmID]
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PHOTOIDX]
GO

---------------------------------------------------------------

