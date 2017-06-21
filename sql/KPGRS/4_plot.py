from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("KPGRS", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="KPGRS", proj="Aitoff")
p.Plot("KPGRS", [photo])

p = DensityPlot(title="KPGRS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("KPGRS_img1", [photo], sizes=["small", "large"])