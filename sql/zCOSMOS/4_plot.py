from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("zCOSMOS", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="zCOSMOS", proj="Aitoff")
p.Plot("zCOSMOS", [spectro])

spectro = DensityPlotLayer("zCOSMOS", "SpecObj", cmap="visual", level=11)

p = DensityPlot(title="zCOSMOS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("zCOSMOS_img1", [spectro], sizes=["small", "large"])