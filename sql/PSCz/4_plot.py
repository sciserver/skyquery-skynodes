from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("PSCz", "PhotoObj", cmap="nir", level=6)

p = DensityPlot(title="IRAS PSCz", proj="Aitoff")
p.Plot("PSCz", [photo])

p = DensityPlot(title="IRAS PSCz", proj="PlateCarree", labels=True, zoom=True)
p.Plot("PSCz_img1", [photo], sizes=["small", "large"])