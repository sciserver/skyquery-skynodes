from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("IRAS", "PhotoObj", cmap="nir", level=6)

p = DensityPlot(title="IRAS", proj="Aitoff")
p.Plot("IRAS", [photo])

p = DensityPlot(title="IRAS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("IRAS_img1", [photo], sizes=["small", "large"])