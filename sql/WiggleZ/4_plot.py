from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("WiggleZ", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="WiggleZ", proj="Aitoff")
p.Plot("WiggleZ", [spectro])

p = DensityPlot(title="WiggleZ", proj="PlateCarree", labels=True, zoom=True)
p.Plot("WiggleZ_img1", [spectro], sizes=["small", "large"])