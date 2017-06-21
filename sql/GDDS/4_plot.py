from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("GDDS", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="GDDS", proj="Aitoff")
p.Plot("GDDS", [photo])

p = DensityPlot(title="GDDS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("GDDS_img1", [photo], sizes=["small", "large"])