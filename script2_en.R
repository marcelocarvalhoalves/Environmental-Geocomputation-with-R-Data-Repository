# Load packages
library(raster)
library(sf)
library(brazilmaps)
library(terra)

# Define geographic extension
e <- extent(495317.1, 518730.6, 7645542.5, 7666693.4) # Define extension by coordinates
plot(e, col='red') # Map the region

# Get municipality polygon
mg <- get_brmap(geo = "City", geo.filter = list(State = 31), class = "sf") # Get data
plot(st_geometry(mg), col = sf.colors(n = 1, alpha = 0.3), border = 'black', bgc = 'gray92', axes = TRUE) # Map
mg # See header

# Define subset by name
lavras <- mg[mg$nome == "LAVRAS",] # Subset
lavras # See header
plot(st_geometry(lavras), graticule = TRUE, col = "grey90", border = 'black', axes = TRUE) # Plot geometry

# Export shapefile
st_write(lavras, dsn= "D:/sr19B/shp/lavras.shp", driver= "ESRI Shapefile", "lavras.shp") # Save results as shapefile

# Import kml
carrancas <- st_read("C:/Aulas/ScriptsPv6_9/3a20222/kml/carrancas.kml") # Import
names(carrancas) # See names
plot(carrancas[1], axes=T, main="Carrancas", col="grey92", lwd=2) # Map 1st attribute
plot(st_geometry(carrancas), axes=T) # Map geometry
dev.off() # Reset plot

# Drop zm dimension
carrancaszm <- st_zm(carrancas, drop = TRUE) # Drop zm

# Plot
plot(carrancaszm[1]) # Map 1st attribute
plot(carrancaszm) # Map all attributes
plot(carrancaszm[1]) # Map 1st attribute
plot(carrancaszm[1], col = "grey92", axes = TRUE, main = "Carrancas") #Mapear com coords e cor
plot(st_geometry(carrancaszm), axes = TRUE, lwd = 2) #Mapear geometria aumentando espessura da linha

# Export shapefile
st_write(carrancaszm,"C:/Aulas/ScriptsPv6_9/3a20222/carrancas.shp", "carrancas.shp")

# Import shapefile using sf
carrancas <- st_read("C:/Aulas/ScriptsPv6_9/3a20222/carrancas.shp")
plot(carrancas[1]) # Map

# Explore terra package functions
# Import shapefile using terra
carrancas_vect <- vect("C:/Aulas/ScriptsPv6_9/3a20222/carrancas.shp") #Importar
class(carrancas_vect) # See class
carrancas_vect # See header

# Converter classes
carrancas_sf <- st_as_sf(carrancas_vect) # Convert spatvect in sf
class(carrancas_sf)

carrancas_terra <- vect(carrancas_sf) # Convert sf in spatvect
class(carrancas_terra)

carrancas_sp <- as_Spatial(carrancas_sf) # Convert sf in sp
class(carrancas_sp)

# Calculate polygon area using terra package
expanse(carrancas_terra, unit="ha")

