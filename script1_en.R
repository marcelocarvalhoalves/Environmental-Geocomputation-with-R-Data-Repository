# Using R with the command line
y <- c(5,4,3,2,1) # Create database y
y # Evaluate the results y

x = c(1,2,3,4,5) # Create database x
x # Evaluate results x

z <- x+y # Create database z with sum x,y
z # Evaluate results z

# Setting up a directory in R
getwd()
setwd("E:/Marcelo/geo3a")

# Installing R packages
install.packages("sf")
install.packages("sos")
install.packages("tmap")
install.packages("devtools")
devtools::install_github("rpradosiqueira/brazilmaps")
install.packages("terra")
install.packages("spData")

# Loading R packages
library(sf)
library(sos)
library(tmap)
library(brazilmaps)
library(spData)

# Disable R packages
detach(package:sf)

# Evaluate information about computer programs and R packages used
print(version)
print(sessionInfo())
print(.libPaths())
packageVersion("sf")
packageVersion("terra")

# Check if there's an R package with keywords
findFn("gis spatial")
findFn("evapotranspiration")

# Mapping and accessing attribute data on the globe with tmap package
data(World) # Access data
qtm(World) # Map

# # View object header, database, geometry type, and CRS
World

# See names in the attribute table
names(World)

# Perform global choropleth mapping
qtm(World, fill = "continent")
qtm(World, fill = "life_exp")


# Defining a geographic region with a polygon at the municipal level
mt <- get_brmap(geo = "City", geo.filter = list(State = 51), class = "sf")
mt # See header
plot(mt[1]) # Map

# Perform a subset in the municipality of Cuiaba
cba <- mt[mt$nome == "CUIABÁ",]

# Mapping with sf plot
plot(st_geometry(cba), graticule = TRUE,
     col = "grey90", border = 'black',
     axes = TRUE)

# Export shapefile
st_write(cba, dsn = "E:/Marcelo/geo3a/shp/cba.shp", driver = "ESRI Shapefile", "cba.shp")


## Create polygon in Google Earth Pro
#See homework 1

# Import kml
carrancas <- st_read("C:/Aulas/ScriptsPv6_9/3a20222/kml/carrancas.kml")
names(carrancas) # See names
plot(carrancas[1], axes=T, main="Carrancas",
     col="grey92", lwd=2) # Map attributes
plot(st_geometry(carrancas), axes=T) # Map geometry
dev.off() # Reset plot

# Remove zm dimension
carrancaszm <- st_zm(carrancas, drop=T)
plot(carrancaszm[1])

amzm <- st_zm(am, drop=T)
plot(amzm[1])

# Export shapefile
st_write(carrancaszm,"C:/Aulas/ScriptsPv6_9/3a20222/shp/carrancas.shp", "carrancas.shp")

# Import shapefile using sf
carrancas <- st_read("C:/Aulas/ScriptsPv6_9/3a20222/carrancas.shp")
plot(carrancas[1]) # Map
