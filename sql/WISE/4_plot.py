from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("WISE", "PhotoObj", cmap="nir", level=6)

p = DensityPlot(title="WISE", proj="Aitoff")
p.Plot("WISE", [photo])

p = DensityPlot(title="WISE", proj="PlateCarree", labels=True, zoom=True)
p.Plot("WISE_img1", [photo], sizes=["small", "large"])