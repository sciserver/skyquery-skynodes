from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("TwoMRS", "SpecObj", cmap="nir", level=6)

p = DensityPlot(title="2MASS RS", proj="Aitoff")
p.Plot("TwoMRS", [spectro])

p = DensityPlot(title="2MASS RS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("TwoMRS_img1", [spectro], sizes=["small", "large"])