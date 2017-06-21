from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("KEPLER", "KIC", cmap="visual", level=6)

p = DensityPlot(title="Kepler", proj="Aitoff")
p.Plot("KEPLER", [photo])

p = DensityPlot(title="Kepler", proj="PlateCarree", labels=True, zoom=True)
p.Plot("KEPLER_img1", [photo], sizes=["small", "large"])