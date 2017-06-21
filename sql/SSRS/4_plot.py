from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("SSRS", "SpecObj", cmap="nir", level=6)

p = DensityPlot(title="SSRS", proj="Aitoff")
p.Plot("SSRS", [photo])

p = DensityPlot(title="SSRS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("SSRS_img1", [photo], sizes=["small", "large"])