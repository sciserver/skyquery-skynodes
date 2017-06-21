from densmap.plot import DensityPlot
from densmap.plot import DensityPlotLayer

photo = DensityPlotLayer("VLA", "GOODSN", cmap="radio", level=6)

p = DensityPlot(title="VLA", proj="Aitoff")
p.Plot("VLA", [photo])

photo = DensityPlotLayer("VLA", "GOODSN", cmap="radio", level=12)

p = DensityPlot(title="VLA GOODS North", proj="PlateCarree", labels=True, zoom=True)
p.Plot("VLA_img1", [photo], sizes=["small", "large"])