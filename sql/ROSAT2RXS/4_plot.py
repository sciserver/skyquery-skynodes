from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("ROSAT2RXS", "SourceObj", cmap="xray", level=6)

p = DensityPlot(title="ROSAT 2RXS", proj="Aitoff")
p.Plot("ROSAT2RXS", [photo])

p = DensityPlot(title="ROSAT 2RXS", proj="PlateCarree", labels=True, zoom=True)
p.Plot("ROSAT2RXS_img1", [photo], sizes=["small", "large"])