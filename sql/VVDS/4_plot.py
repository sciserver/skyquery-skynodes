from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("VVDS", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="VVDS", proj="Aitoff")
p.Plot("VVDS", [spectro])

spectro = DensityPlotLayer("VVDS", "SpecObj", cmap="visual", level=11)

p = DensityPlot(title="VVDS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("VVDS_img1", [spectro], sizes=["small", "large"])