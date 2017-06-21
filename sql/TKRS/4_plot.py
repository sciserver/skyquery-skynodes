from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("TKRS", "SpecObj", cmap="nir", level=6)

p = DensityPlot(title="TKRS", proj="Aitoff")
p.Plot("TKRS", [spectro])

spectro = DensityPlotLayer("TKRS", "SpecObj", cmap="nir", level=12)

p = DensityPlot(title="TKRS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("TKRS_img1", [spectro], sizes=["small", "large"])