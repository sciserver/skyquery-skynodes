from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("DLS", "PhotoObj", cmap="visual", level=6)

p = DensityPlot(title="DLS", proj="Aitoff")
p.Plot("DLS", [photo])

p = DensityPlot(title="DLS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("DLS_img1", [photo], sizes=["small", "large"])