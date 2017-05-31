from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

fis = DensityPlotLayer("AKARI", "FIS", cmap="viridis")
irc = DensityPlotLayer("AKARI", "IRC", cmap="plasma")

p = DensityPlot(title="AKARI", proj="Aitoff")
p.Plot("AKARI", [fis, irc])

p = DensityPlot(title="AKARI FIS", proj="Aitoff")
p.Plot("AKARI_FIS", [fis])

p = DensityPlot(title="AKARI IRC", proj="Aitoff")
p.Plot("AKARI_IRC", [irc])