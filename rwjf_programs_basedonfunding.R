
setwd("C:\\Users\\as07785\\Downloads\\")
require("rgdal") # requires sp, will use proj.4 if installed
require("maptools")
require("ggplot2")
require("plyr")
rwjf<- readOGR("C:\\Users\\as07785\\Downloads\\shrava_rwjf.shp",
               layer = "shrava_rwjf", verbose = FALSE)
qpal <- colorQuantile("Blues", rwjf$Sum_of_amo, n = 1000)

factpal <- colorFactor(topo.colors(5), rwjf$Sum_of_amo)
qpal <- colorQuantile("RdYlBu", rwjf$Sum_of_amo, n = 5)
leaflet(rwjf) %>%addTiles() %>%
  addPolygons(
    stroke = FALSE, fillOpacity = 2, smoothFactor = 1,
    color = ~qpal(Sum_of_amo)
  )%>%
  addLegend(pal = qpal, values = ~Sum_of_amo,
            title = "Investments(Percentile)",
            labFormat = labelFormat(prefix = "$"),
            opacity = 1
  )
