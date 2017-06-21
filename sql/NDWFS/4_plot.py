from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("NDWFS", "PhotoObj", cmap="nir", level=6)

p = DensityPlot(title="NDWFS", proj="Aitoff")
p.Plot("NDWFS", [photo])

photo = DensityPlotLayer("NDWFS", "PhotoObj", cmap="nir", level=12)

p = DensityPlot(title="NDWFS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("NDWFS_img1", [photo], sizes=["small", "large"])