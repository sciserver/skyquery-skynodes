from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

obs = DensityPlotLayer("WMAP", "Obs", cmap="radio", level=5)

p = DensityPlot(title="WMAP", proj="Aitoff")
p.Plot("WMAP", [obs])

p = DensityPlot(title="WMAP", proj="PlateCarree", labels=True, zoom=True)
p.Plot("WMAP_img1", [obs], sizes=["small", "large"])