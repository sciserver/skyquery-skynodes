from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("AGC", "PhotoObj", cmap="radio", level=6)

p = DensityPlot(title="AGC", proj="Aitoff")
p.Plot("AGC", [photo])

p = DensityPlot(title="AGC", proj="PlateCarree", labels=True, zoom=True)
p.Plot("AGC_img1", [photo], sizes=["small", "large"])