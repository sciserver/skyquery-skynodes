from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("OGLEIII", "VariableStars", cmap="visual", level=6)

p = DensityPlot(title="OGLE III", proj="Aitoff")
p.Plot("OGLEIII", [photo])

p = DensityPlot(title="OGLE III", proj="PlateCarree", labels=True, zoom=True)
p.Plot("OGLEIII_img1", [photo], sizes=["small", "large"])