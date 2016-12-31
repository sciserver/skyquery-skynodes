-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoPSC_Zone] ON [dbo].[PhotoPSC] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO


-- HTM index
CREATE NONCLUSTERED INDEX [IX_PhotoPSC_HtmID] ON [dbo].[PhotoPSC] 
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
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoPSC_ZoneID] ON [dbo].[PhotoPSC] 
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
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO

---------------------------------------------------------------

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoXSC_Zone] ON [dbo].[PhotoXSC] 
(
	[dec] ASC,
	[ra] ASC,
	[cx] ASC,
	[cy] ASC,
	[cz] ASC
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO


-- HTM index
CREATE NONCLUSTERED INDEX [IX_PhotoXSC_HtmID] ON [dbo].[PhotoXSC] 
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
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO

-- Index to support on the fly zone table creation
CREATE NONCLUSTERED INDEX [IX_PhotoXSC_ZoneID] ON [dbo].[PhotoXSC] 
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
)WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON) ON [PRIMARY]
GO

---------------------------------------------------------------