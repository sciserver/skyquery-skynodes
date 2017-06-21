from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("CHANDRA", "PhotoObj", cmap="xray", level=6)

p = DensityPlot(title="CHANDRA", proj="Aitoff")
p.Plot("CHANDRA", [photo])

p = DensityPlot(title="CHANDRA", proj="PlateCarree", labels=True, zoom=True)
p.Plot("CHANDRA_img1", [photo], sizes=["small", "large"])