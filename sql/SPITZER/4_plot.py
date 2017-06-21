from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

goodsn16 = DensityPlotLayer("SPITZER", "goodsnIRS16micron", cmap="nir", level=6)
goodsn24 = DensityPlotLayer("SPITZER", "goodsnMIPS24micron", cmap="nir", level=6)
goodss16 = DensityPlotLayer("SPITZER", "goodssIRS16micron", cmap="nir", level=6)
goodss24 = DensityPlotLayer("SPITZER", "goodssMIPS24micron", cmap="nir", level=6)

p = DensityPlot(title="SPITZER", proj="Aitoff")
p.Plot("SPITZER", [goodsn16, goodsn24, goodss16, goodss24])

goodsn16 = DensityPlotLayer("SPITZER", "goodsnIRS16micron", cmap="nir", level=12)
goodsn24 = DensityPlotLayer("SPITZER", "goodsnMIPS24micron", cmap="nir", level=12)
goodss16 = DensityPlotLayer("SPITZER", "goodssIRS16micron", cmap="nir", level=12)
goodss24 = DensityPlotLayer("SPITZER", "goodssMIPS24micron", cmap="nir", level=12)

p = DensityPlot(title="SPITZER GOODS North IRS 16 um", proj="PlateCarree", labels=True, zoom=True)
p.Plot("SPITZER_img1", [goodsn16], sizes=["small", "large"])

p = DensityPlot(title="SPITZER GOODS North MIPS 24 um", proj="PlateCarree", labels=True, zoom=True)
p.Plot("SPITZER_img2", [goodsn24], sizes=["small", "large"])

p = DensityPlot(title="SPITZER GOODS South IRS 16 um", proj="PlateCarree", labels=True, zoom=True)
p.Plot("SPITZER_img3", [goodss16], sizes=["small", "large"])

p = DensityPlot(title="SPITZER GOODS South MIPS 24 um", proj="PlateCarree", labels=True, zoom=True)
p.Plot("SPITZER_img4", [goodss24], sizes=["small", "large"])