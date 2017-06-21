from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("NVSS", "PhotoObj", cmap="radio", level=6)

p = DensityPlot(title="NVSS", proj="Aitoff")
p.Plot("NVSS", [photo])

p = DensityPlot(title="NVSS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("NVSS_img1", [photo], sizes=["small", "large"])