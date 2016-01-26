USE [SkyNode_ROSAT]
GO

CREATE TABLE [dbo].[Rosat]
(
	[objid] [bigint] NOT NULL,
	[catalog] [varchar](4) NOT NULL,
	[seqName] [varchar](32) NOT NULL,
	[srcNam] [varchar](32) NOT NULL,
	[pErr] [int] NULL,
	[srcCps] [real] NOT NULL,
	[srcCpsErr] [real] NULL,
	[lhmdr] [real] NOT NULL,
	[oax] [int] NOT NULL,
	[texp] [int] NOT NULL,
	[v] [char](1) NULL,
	[srcflags] [varchar](13) NOT NULL,
	[seqflags] [varchar](8) NOT NULL,
	[tbegin] [int] NOT NULL,
	[tend] [int] NOT NULL,
	[obsid] [varchar](20) NOT NULL,
	[site] [varchar](16) NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmid] [bigint] NOT NULL,
	[zoneid] [bigint] NOT NULL,
	[lii] [float] NOT NULL,
	[bii] [float] NOT NULL,
	[im_x] [real] NOT NULL,
	[im_y] [real] NOT NULL,
	[im_xErr] [real] NULL,
	[im_yErr] [real] NULL,
	[drb] [int] NOT NULL,
	[dsr] [int] NOT NULL,
	[vig] [real] NULL,
	[bcpsc] [real] NOT NULL,
	[priFlg] [varchar](8) NULL,
	[lhmd] [int] NOT NULL,
	[dcs] [int] NOT NULL,
	[msx] [int] NOT NULL,
	[mflag] [char](1) NOT NULL,
	[lhml] [int] NULL,
	[rml] [int] NOT NULL,
	[ext] [int] NOT NULL,
	[extl] [int] NOT NULL,
	[ckuf] [varchar](4) NOT NULL,
	[hr1] [real] NOT NULL,
	[hr1Err] [real] NOT NULL,
	[hr2] [real] NOT NULL,
	[hr2Err] [real] NOT NULL,
	[a] [int] NOT NULL,
	[b] [int] NOT NULL,
	[c] [int] NOT NULL,
	[d] [int] NOT NULL,
	[aErr] [real] NOT NULL,
	[bErr] [real] NOT NULL,
	[cErr] [real] NOT NULL,
	[dErr] [real] NOT NULL,
	[cspl] [real] NOT NULL,
	[csrs] [real] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [Rosat]
ADD CONSTRAINT [PK_Rosat] PRIMARY KEY
(
	[objid]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE INDEX [IX_Rosat_Zone] ON [dbo].[Rosat]
(
	[dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

CREATE INDEX [IX_Rosat_ZoneID] ON [dbo].[Rosat]
(
	[zoneid], [dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

CREATE INDEX [IX_Rosat_HtmID] ON [dbo].[Rosat]
(
	[htmid], [dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

---------------------------------------------------------------

CREATE TABLE [dbo].[RASS]
(
	[objid] [bigint] NOT NULL,
	[catalog] [varchar](4) NOT NULL,
	[srcNam] [varchar](32) NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmid] [bigint] NOT NULL,
	[zoneid] [bigint] NOT NULL,
	[pErr] [real] NOT NULL,
	[npedm] [varchar](5) NOT NULL,
	[riv] [varchar](4) NOT NULL,
	[srcCps] [real] NOT NULL,
	[srcCpsErr] [real] NOT NULL,
	[bgrCpsA] [real] NOT NULL,
	[exp] [int] NOT NULL,
	[hr1] [real] NOT NULL,
	[hr1Err] [real] NOT NULL,
	[hr2] [real] NOT NULL,
	[hr2Err] [real] NOT NULL,
	[ext] [int] NOT NULL,
	[extl] [int] NOT NULL,
	[srcl] [int] NOT NULL,
	[extr] [int] NOT NULL,
	[priFlg] [varchar](8) NOT NULL,
	[vigf] [real] NOT NULL,
	[orgdat] [int] NOT NULL,
	[moddat] [int] NOT NULL,
	[id] [int] NOT NULL,
	[fieldsrc] [varchar](32) NOT NULL,
	[rct] [varchar](4) NULL,
	[itb] [real] NULL,
	[ite] [real] NULL,
	[rl] [int] NULL
) ON [PRIMARY]

GO



ALTER TABLE [RASS]
ADD CONSTRAINT [PK_RASS] PRIMARY KEY
(
	[objid]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE INDEX [IX_RASS_Zone] ON [dbo].[RASS]
(
	[dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

CREATE INDEX [IX_RASS_ZoneID] ON [dbo].[RASS]
(
	[zoneid], [dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

CREATE INDEX [IX_RASS_HtmID] ON [dbo].[RASS]
(
	[htmid], [dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

---------------------------------------------------------------

CREATE TABLE [dbo].[HRI]
(
	[objid] [bigint] NOT NULL,
	[catalog] [varchar](4) NOT NULL,
	[seqName] [varchar](32) NOT NULL,
	[srcNam] [varchar](32) NOT NULL,
	[pErr] [int] NULL,
	[srcCps] [real] NOT NULL,
	[srcCpsErr] [real] NULL,
	[snr] [real] NOT NULL,
	[oax] [int] NOT NULL,
	[texp] [int] NOT NULL,
	[v] [char](1) NULL,
	[srcflags] [varchar](13) NOT NULL,
	[seqflags] [varchar](8) NOT NULL,
	[tbegin] [int] NOT NULL,
	[tend] [int] NOT NULL,
	[obsid] [varchar](20) NOT NULL,
	[site] [varchar](16) NOT NULL,
	[ra] [float] NOT NULL,
	[dec] [float] NOT NULL,
	[cx] [float] NOT NULL,
	[cy] [float] NOT NULL,
	[cz] [float] NOT NULL,
	[htmid] [bigint] NOT NULL,
	[zoneid] [bigint] NOT NULL,
	[lii] [float] NOT NULL,
	[bii] [float] NOT NULL,
	[epi] [real] NOT NULL,
	[x] [real] NOT NULL,
	[y] [real] NOT NULL,
	[im_x] [real] NOT NULL,
	[im_y] [real] NOT NULL,
	[lev1_x] [real] NOT NULL,
	[lev1_y] [real] NOT NULL,
	[c_rd] [real] NOT NULL,
	[g_c] [int] NOT NULL,
	[g_cErr] [int] NOT NULL,
	[bkg] [int] NOT NULL,
	[qe] [real] NOT NULL,
	[vig] [real] NOT NULL,
	[csc] [real] NOT NULL,
	[xsz] [int] NOT NULL,
	[ysz] [int] NOT NULL,
	[box_c] [int] NOT NULL,
	[thr] [int] NOT NULL,
	[uprb] [real] NOT NULL,
	[x_ec] [real] NOT NULL,
	[y_ec] [real] NOT NULL,
	[r_ec] [real] NOT NULL,
	[ec_csc] [real] NOT NULL,
	[sz_cor] [real] NOT NULL,
	[esz_cor] [real] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [HRI]
ADD CONSTRAINT [PK_HRI] PRIMARY KEY
(
	[obsid]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
ON [PRIMARY]
GO

CREATE INDEX [IX_RASS_Zone] ON [dbo].[RASS]
(
	[dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

CREATE INDEX [IX_RASS_ZoneID] ON [dbo].[RASS]
(
	[zoneid], [dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO

CREATE INDEX [IX_RASS_HtmID] ON [dbo].[RASS]
(
	[htmid], [dec], [ra], [cx], [cy], [cz]
)
WITH (DATA_COMPRESSION = PAGE, SORT_IN_TEMPDB = ON)
GO