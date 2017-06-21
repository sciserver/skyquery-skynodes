from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("LAMOSTDR1", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="LAMOST DR1", proj="Aitoff")
p.Plot("LAMOSTDR1", [photo])

p = DensityPlot(title="LAMOST DR1", proj="PlateCarree", labels=True, zoom=True)
p.Plot("LAMOSTDR1_img1", [photo], sizes=["small", "large"])