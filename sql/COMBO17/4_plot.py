from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("COMBO17", "PhotoObj", cmap="visual", level=6)

p = DensityPlot(title="COMBO 17", proj="Aitoff")
p.Plot("COMBO17", [photo])

photo = DensityPlotLayer("COMBO17", "PhotoObj", cmap="visual", level=14)

p = DensityPlot(title="COMBO 17", proj="PlateCarree", labels=True, zoom=True)
p.Plot("COMBO17_img1", [photo], sizes=["small", "large"])