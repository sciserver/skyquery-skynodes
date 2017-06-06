from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("ACVS", "PhotoObj", cmap="visual", level=5)

p = DensityPlot(title="ACVS", proj="Aitoff")
p.Plot("ACVS", [photo])

p = DensityPlot(title="ACVS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("ACVS_img1", [photo], sizes=["small", "large"])