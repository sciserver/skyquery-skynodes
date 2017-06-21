from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("VIPERSPDR2", "PhotoObj", cmap="visual", level=6)
spec = DensityPlotLayer("VIPERSPDR2", "SpecObj", cmap="red", level=6)

p = DensityPlot(title="VIPERS PDR2", proj="Aitoff")
p.Plot("VIPERSPDR2", [photo, spec])

p = DensityPlot(title="VIPERS PDR2 photo", proj="PlateCarree", labels=True, zoom=True)
p.Plot("VIPERSPDR2_PhotoObj", [photo,])

p = DensityPlot(title="VIPERS PDR2 spectro", proj="PlateCarree", labels=True, zoom=True)
p.Plot("VIPERSPDR2_SpecObj", [spec,])