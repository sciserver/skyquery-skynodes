CREATE NONCLUSTERED INDEX [IX_sdssTileAll_htmID] ON [dbo].[sdssTileAll]
(
	[htmID] ASC
)
INCLUDE
(
	[raCen],
	[decCen],
	[cx],
	[cy],
	[cz]
) 
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_sdssTileAll_zone] ON [dbo].[sdssTileAll]
(
	[decCen] ASC
)
INCLUDE
(
	[raCen],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX [IX_sdssTileAll_zoneID] ON [dbo].[sdssTileAll]
(
	[zoneID] ASC,
	[decCen] ASC
)
INCLUDE
(
	[raCen],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]

---------------------------------------------------------------

---------------------------------------------------------------

CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_htmID] ON [dbo].[PhotoObjAll]
(
	[htmID] ASC
)
INCLUDE
(
 	[type],
	[mode],
	[ra],
	[dec],
	[cx],
	[cy],
	[cz]
) 
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_zone] ON [dbo].[PhotoObjAll]
(
	[dec] ASC
)
INCLUDE
(
 	[type],
	[mode],
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

CREATE NONCLUSTERED INDEX [IX_PhotoObjAll_zoneID] ON [dbo].[PhotoObjAll]
(
	[zoneID] ASC,
	[dec] ASC
)
INCLUDE
(
 	[type],
	[mode],
	[ra],
	[cx],
	[cy],
	[cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PHOTOIDX]

GO

