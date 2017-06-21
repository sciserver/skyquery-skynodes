from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("TwoQZ", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="2QZ", proj="Aitoff")
p.Plot("TwoQZ", [spectro])

p = DensityPlot(title="2QZ", proj="PlateCarree", labels=True, zoom=True)
p.Plot("TwoQZ_img1", [spectro], sizes=["small", "large"])