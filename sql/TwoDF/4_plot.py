from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("TWODF", "SpecObj", cmap="visual", level=6)
photo = DensityPlotLayer("TWODF", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="2dF", proj="Aitoff")
p.Plot("TWODF", [photo, spectro])

p = DensityPlot(title="2dF photo", proj="PlateCarree", labels=True, zoom=True)
p.Plot("TWODF_img1", [photo], sizes=["small", "large"])

p = DensityPlot(title="2dF spectro", proj="PlateCarree", labels=True, zoom=True)
p.Plot("TWODF_img2", [spectro], sizes=["small", "large"])