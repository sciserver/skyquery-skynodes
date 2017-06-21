from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("UZC", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="UZC", proj="Aitoff")
p.Plot("UZC", [spectro])

p = DensityPlot(title="UZC", proj="PlateCarree", labels=True, zoom=True)
p.Plot("UZC_img1", [spectro], sizes=["small", "large"])