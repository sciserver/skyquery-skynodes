from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

spectro = DensityPlotLayer("TwoSLAQ", "SpecObj", cmap="visual", level=6)

p = DensityPlot(title="2SLAQ", proj="Aitoff")
p.Plot("TwoSLAQ", [spectro])
