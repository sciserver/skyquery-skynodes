from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("HDF", "PhotoObj", cmap="visual", level=6)

p = DensityPlot(title="HDF", proj="Aitoff")
p.Plot("HDF", [photo])

photo = DensityPlotLayer("HDF", "PhotoObj", cmap="visual", level=14)

p = DensityPlot(title="HDF", proj="PlateCarree", labels=True, zoom=True)
p.Plot("HDF_img1", [photo], sizes=["small", "large"])