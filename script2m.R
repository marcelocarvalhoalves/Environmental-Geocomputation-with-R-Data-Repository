#Habilitar pacotes
library(sf)
library(raster)
library(rgdal)

install.packages("raster")

#Importar kml
teste <- st_read(
  "E:/Marcelo/geo3a/shp/Rosario.kml")#Importar e ver cabeçalho

teste <- st_read(
  "E:/Marcelo/geo3a/shp/Rosario.kml", quiet=T)#Importar

bh <- st_read(
  "E:/Marcelo/geo3a/kml/bh.kml", quiet=T)#Importar
bh

#Remover dimensão Z
testezm<-st_zm(teste, drop=T) #remover Z
head(testezm) #ver cabeçalho
testezm #ver cabeçalho

bhzm<-st_zm(bh, drop=T) #remover Z
head(bhzm) #ver cabeçalho
bhzm #ver cabeçalho

#Ver atributos do polígono
names(testezm)

names(bhzm)

#Mapear polígono
plot(testezm) #mapear todos atributos
plot(testezm[1]) #mapear o primeiro atributo
plot(testezm[1], col="grey92", axes=T, 
          main="Rosário") #Mapear com coords e cor

plot(testezm[1], col="white", axes=T, 
     main="Rosário", bgc="grey92") #Mapear com coords e cor


plot(bhzm) #mapear todos atributos
plot(bhzm[1]) #mapear o primeiro atributo
plot(bhzm[1], col="grey92", axes=T, 
     main="Belo Horizonte") #Mapear com coords e cor

plot(bhzm[1], col="white", axes=T, 
     main="Belo Horizonte", bgc="grey92") #Mapear com coords e cor


#Exportar polígono como shapefile
st_write(testezm, dsn= "E:/Marcelo/geo3a/shp/Rosario.shp", 
           driver= "ESRI Shapefile", "Rosario.shp")

st_write(bhzm, dsn= "E:/Marcelo/geo3a/shp/bhzm.shp", 
         driver= "ESRI Shapefile", "bhzm.shp")

#Importar polígono shapefile
rosario<-st_read("E:/Marcelo/geo3a/shp/Rosario.shp")
plot(rosario[2], col="grey")

bh<-st_read("E:/Marcelo/geo3a/shp/bhzm.shp")
plot(bh[2], col="grey")


#Mapear geometria no sf
plot(st_geometry(rosario), axes=T, lwd=2) #Mapear geometria aumentando espessura da linha

plot(st_geometry(bh), axes=T, lwd=2) #Mapear geometria aumentando espessura da linha

#ver classe
class(rosario)

class(bh)

#Explorar funções do pacote terra
#Habilitar pacote terra
library(terra)
## Importar shape
rosa<-vect("E:/Marcelo/geo3a/shp/Rosario.shp") #Importar
class(rosa) #ver classe
rosa #ver cabeçalho

bht<-vect("E:/Marcelo/geo3a/shp/bhzm.shp") #Importar
class(bht) #ver classe
bht #ver cabeçalho

#Converter classes
rosasf <-st_as_sf(rosa) #Converter spatvect em sf
class(rosasf)

rosaterra<-vect(rosasf) #Converter sf em spatvect
class(rosaterra)

rosasp <-as_Spatial(rosasf) #Conveter sf em sp
class(rosasp)


bhsf <-st_as_sf(bht) #Converter spatvect em sf
class(bhsf)

bhterra<-vect(bhsf) #Converter sf em spatvect
class(bhterra)

bhsp <-as_Spatial(bhsf) #Conveter sf em sp
class(bhsp)


#Calcular área do polígono pelo pacote terra
expanse(bhterra, unit="ha")
