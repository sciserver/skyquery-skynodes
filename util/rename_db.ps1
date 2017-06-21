$old = "UCZ"
$new = "UZC"

foreach ($server in "skyquery01", "skyquery02", "skyquery03") {
    foreach ($node in "a", "b") {
        for ($i = 0; $i -lt 8; $i++) {
            mv "\\$server\data\ssd_$node\ssd$i\Graywulf\SkyQuery\$old" `
               "\\$server\data\ssd_$node\ssd$i\Graywulf\SkyQuery\$new"

            mv "\\$server\data\ssd_$node\ssd$i\Graywulf\SkyQuery\$new\FULL\PROD\SkyNode_$old" `
               "\\$server\data\ssd_$node\ssd$i\Graywulf\SkyQuery\$new\FULL\PROD\SkyNode_$new"
            
            mv "\\$server\data\ssd_$node\ssd$i\Graywulf\SkyQuery\$new\FULL\STAT\SkyNode_${old}_STAT" `
               "\\$server\data\ssd_$node\ssd$i\Graywulf\SkyQuery\$new\FULL\STAT\SkyNode_${new}_STAT"
        }
    }
}