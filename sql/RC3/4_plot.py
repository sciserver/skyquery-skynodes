from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("RC3", "PhotoObj", cmap="visual", level=6)

p = DensityPlot(title="RC3", proj="Aitoff")
p.Plot("RC3", [photo])

p = DensityPlot(title="RC3", proj="PlateCarree", labels=True, zoom=True)
p.Plot("RC3_img1", [photo], sizes=["small", "large"])