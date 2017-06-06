from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("SDSSDR12", "PhotoObj", cmap="visual", level=6)
spec = DensityPlotLayer("SDSSDR12", "SpecObj", cmap="red", level=6)

p = DensityPlot(title="SDSS DR12", proj="Aitoff")
p.Plot("SDSSDR12", [photo, spec])

p = DensityPlot(title="SDSS DR12 photo", proj="Aitoff")
p.Plot("SDSSDR12_PhotoObj", [photo,])

p = DensityPlot(title="SDSS DR12 spectro", proj="Aitoff")
p.Plot("SDSSDR12_SpecObj", [spec,])