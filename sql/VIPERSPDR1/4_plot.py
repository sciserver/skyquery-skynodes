from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("VIPERSPDR1", "PhotoObj", cmap="visual", level=6)
spec = DensityPlotLayer("VIPERSPDR1", "SpecObj", cmap="red", level=6)

p = DensityPlot(title="VIPERS PDR1", proj="Aitoff")
p.Plot("VIPERSPDR1", [photo, spec])

p = DensityPlot(title="VIPERS PDR1 photo", proj="PlateCarree", labels=True, zoom=True)
p.Plot("VIPERSPDR1_PhotoObj", [photo,])

p = DensityPlot(title="VIPERS PDR1 spectro", proj="PlateCarree", labels=True, zoom=True)
p.Plot("VIPERSPDR1_SpecObj", [spec,])