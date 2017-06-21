from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

a = DensityPlotLayer("LBG3Z", "DeepImagingObs", cmap="nir", level=6)
b = DensityPlotLayer("LBG3Z", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="LBG3Z", proj="Aitoff")
p.Plot("LBG3Z", [a,b])

p = DensityPlot(title="LBG3Z", proj="PlateCarree", labels=True, zoom=True)
p.Plot("LBG3Z_img1", [a,b], sizes=["small", "large"])