from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("CSDR2", "PhotoObj", cmap="visual", level=6)

p = DensityPlot(title="CS DR2", proj="Aitoff")
p.Plot("CSDR2", [photo])

p = DensityPlot(title="CS DR2", proj="PlateCarree", labels=True, zoom=True)
p.Plot("CSDR2_img1", [photo], sizes=["small", "large"])