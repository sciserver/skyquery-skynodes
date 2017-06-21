from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("MGC", "PhotoObj", cmap="visual", level=6)

p = DensityPlot(title="MGC", proj="Aitoff")
p.Plot("MGC", [photo])

p = DensityPlot(title="MGC", proj="PlateCarree", labels=True, zoom=True)
p.Plot("MGC_img1", [photo], sizes=["small", "large"])