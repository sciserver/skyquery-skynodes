from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

goodsn = DensityPlotLayer("HERSCHEL", "goodsNorth", cmap="fir", level=6)
goodss = DensityPlotLayer("HERSCHEL", "goodsSouth", cmap="fir", level=6)

p = DensityPlot(title="Herschel", proj="Aitoff")
p.Plot("HERSCHEL", [goodsn, goodss])

goodsn = DensityPlotLayer("HERSCHEL", "goodsNorth", cmap="fir", level=12)
goodss = DensityPlotLayer("HERSCHEL", "goodsSouth", cmap="fir", level=12)

p = DensityPlot(title="Herschel GOODS North", proj="PlateCarree", labels=True, zoom=True)
p.Plot("HERSCHEL_img1", [goodsn])

p = DensityPlot(title="Herschel GOODS South", proj="PlateCarree", labels=True, zoom=True)
p.Plot("HERSCHEL_img2", [goodsn])