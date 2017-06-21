from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("GALEX", "PhotoObjAll", cmap="nuv", level=6)

p = DensityPlot(title="GALEX", proj="Aitoff")
p.Plot("GALEX", [photo])

p = DensityPlot(title="GALEX", proj="PlateCarree", labels=True, zoom=True)
p.Plot("GALEX_img1", [photo], sizes=["small", "large"])