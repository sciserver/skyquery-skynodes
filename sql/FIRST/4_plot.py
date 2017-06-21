from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("FIRST", "PhotoObj", cmap="radio", level=6)

p = DensityPlot(title="FIRST", proj="Aitoff")
p.Plot("FIRST", [photo])

p = DensityPlot(title="FIRST", proj="PlateCarree", labels=True, zoom=True)
p.Plot("FIRST_img1", [photo], sizes=["small", "large"])