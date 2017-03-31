# Create directory structure to mimic skynode configuration

foreach ($s in "ssd_a", "ssd_b") { For ($i=0; $i -lt 8; $i++) { mkdir $s\ssd$i\Graywulf\SkyQuery\GALEXGR6\FULL\PROD\SkyNode_GALEXGR6 }  }