# Create directory structure to mimic skynode configuration

foreach ($s in "ssd_a", "ssd_b") { For ($i=0; $i -lt 8; $i++) { mkdir $s\ssd$i\Graywulf\SkyQuery\GAIADR1\FULL\PROD\SkyNode_GAIADR1 }  }