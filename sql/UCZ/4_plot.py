from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("UCZ", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="UCZ", proj="Aitoff")
p.Plot("UCZ", [spectro])

p = DensityPlot(title="UCZ", proj="PlateCarree", labels=True, zoom=True)
p.Plot("UCZ_img1", [spectro], sizes=["small", "large"])