from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spec = DensityPlotLayer("FORS", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="FORS", proj="Aitoff")
p.Plot("FORS", [spec])

spec = DensityPlotLayer("FORS", "SpecObj", cmap="visual", level=14)

p = DensityPlot(title="FORS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("FORS_img1", [spec], sizes=["small", "large"])