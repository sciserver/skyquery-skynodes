from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("SDSSDR13", "PhotoObj", cmap="visual", level=6)
spec = DensityPlotLayer("SDSSDR13", "SpecObj", cmap="red", level=6)

p = DensityPlot(title="SDSS DR13", proj="Aitoff")
p.Plot("SDSSDR13", [photo, spec])

p = DensityPlot(title="SDSS DR13 photo", proj="Aitoff")
p.Plot("SDSSDR13_PhotoObj", [photo,])

p = DensityPlot(title="SDSS DR13 spectro", proj="Aitoff")
p.Plot("SDSSDR13_SpecObj", [spec,])