from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("DES", "PhotoObj", cmap="visual", level=6)

p = DensityPlot(title="DES", proj="Aitoff")
p.Plot("DES", [photo])

p = DensityPlot(title="DES", proj="PlateCarree", labels=True, zoom=True)
p.Plot("DES_img1", [photo], sizes=["small", "large"])