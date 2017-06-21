from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("USNOB", "PhotoObj", cmap="visual", level=6)

p = DensityPlot(title="USNOB", proj="Aitoff")
p.Plot("USNOB", [photo])

p = DensityPlot(title="USNOB", proj="PlateCarree", labels=True, zoom=True)
p.Plot("USNOB_img1", [photo], sizes=["small", "large"])