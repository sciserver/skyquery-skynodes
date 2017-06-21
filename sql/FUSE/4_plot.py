from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("FUSE", "PhotoObj", cmap="fuv", level=6)

p = DensityPlot(title="FUSE", proj="Aitoff")
p.Plot("FUSE", [photo])

p = DensityPlot(title="FUSE", proj="PlateCarree", labels=True, zoom=True)
p.Plot("FUSE_img1", [photo], sizes=["small", "large"])