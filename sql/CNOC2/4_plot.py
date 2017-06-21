from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spec = DensityPlotLayer("CNOC2", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="CNOC2", proj="Aitoff")
p.Plot("CNOC2", [spec])

spec = DensityPlotLayer("CNOC2", "SpecObj", cmap="visual", level=14)

p = DensityPlot(title="CNOC2", proj="PlateCarree", labels=True, zoom=True)
p.Plot("CNOC2_img1", [spec], sizes=["small", "large"])