from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

psc = DensityPlotLayer("TWOMASS", "PhotoPSC", cmap="nir", level=6)
xsc = DensityPlotLayer("TWOMASS", "PhotoXSC", cmap="nir", level=6)

p = DensityPlot(title="2MASS", proj="Aitoff")
p.Plot("TWOMASS", [psc])

p = DensityPlot(title="2MASS PSC", proj="PlateCarree", labels=True, zoom=True)
p.Plot("TWOMASS_img1", [psc], sizes=["small", "large"])

p = DensityPlot(title="2MASS XSC", proj="PlateCarree", labels=True, zoom=True)
p.Plot("TWOMASS_img2", [xsc], sizes=["small", "large"])