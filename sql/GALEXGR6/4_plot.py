from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("GALEXGR6", "PhotoObjAll", cmap="nuv", level=6)

p = DensityPlot(title="GALEX GR6", proj="Aitoff")
p.Plot("GALEXGR6", [photo])

p = DensityPlot(title="GALEX GR6", proj="PlateCarree", labels=True, zoom=True)
p.Plot("GALEXGR6_img1", [photo], sizes=["small", "large"])