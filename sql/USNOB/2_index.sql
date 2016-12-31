-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoObj_Zone] ON [dbo].[PhotoObj] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO

-- Index to support zoneID-based search
CREATE NONCLUSTERED INDEX [IX_PhotoObj_ZoneID] ON [dbo].[PhotoObj] 
(
	[zoneID] ASC,
	[ra] ASC
)
INCLUDE
(
	[dec],	
	[cx],
	[cy],
	[cz]
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO


-- HTM index
CREATE NONCLUSTERED INDEX [IX_PhotoObj_HtmID] ON [dbo].[PhotoObj] 
(
	[htmid] ASC,
	[ra] ASC,
	[dec] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO