from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("K20", "SpecObj", cmap="nir", level=6)

p = DensityPlot(title="K20", proj="Aitoff")
p.Plot("K20", [photo])

p = DensityPlot(title="K20", proj="PlateCarree", labels=True, zoom=True)
p.Plot("K20_img1", [photo], sizes=["small", "large"])