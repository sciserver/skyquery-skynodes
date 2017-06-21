from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("GAIADR1", "Source", cmap="visual", level=6)

p = DensityPlot(title="GAIA DR1", proj="Aitoff")
p.Plot("GAIADR1", [photo])

p = DensityPlot(title="GAIA DR1", proj="PlateCarree", labels=True, zoom=True)
p.Plot("GAIADR1_img1", [photo], sizes=["small", "large"])