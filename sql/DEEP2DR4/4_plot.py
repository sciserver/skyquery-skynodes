from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spec = DensityPlotLayer("DEEP2DR4", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="DEEP2 DR4", proj="Aitoff")
p.Plot("DEEP2DR4", [spec])

spec = DensityPlotLayer("DEEP2DR4", "SpecObj", cmap="visual", level=14)

p = DensityPlot(title="DEEP2 DR4", proj="PlateCarree", labels=True, zoom=True)
p.Plot("DEEP2DR4_img1", [spec], sizes=["small", "large"])