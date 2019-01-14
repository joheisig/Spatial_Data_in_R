# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

list.of.packages <- c("raster", "rgdal", "rgeos", "sp", "sf")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
new.packages <- append(new.packages, list.of.packages[(list.of.packages %in% old.packages()[,"Package"])])
if(length(new.packages)) install.packages(new.packages)

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

library(raster);library(rgdal);library(rgeos);library(sf);library(sp);
# data folder
loc <- "Spatial_Data_in_R/Vector_Basics/data"

ch <- readOGR(file.path(.get_course_path(), loc, "CHE_adm0.shp"), verbose = FALSE)
z <- readOGR(file.path(.get_course_path(), loc, "CHE_adm1.shp"), verbose = FALSE)
z.nat <- readOGR(file.path(.get_course_path(), loc, "natural_zurich.shp"), verbose = FALSE) 
z.lakes <- subset(z.nat, type=="water")
z.poi <- read.csv(file.path(.get_course_path(), loc,"points_zurich.csv"))
z.poi <- SpatialPointsDataFrame(z.poi[,4:5], z.poi, proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))
z.roads <- readOGR(file.path(.get_course_path(), loc, "roads_zurich.shp"), verbose = FALSE)
z.streams <- readOGR(file.path(.get_course_path(), loc, "waterways_zurich.shp"), verbose = FALSE)

z.ras <- raster(ext=extent(z), crs='+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0', resolution=0.005)
values(z.ras) <- 1

plot(ch, main="Switzerland")
lines(z, col="red")

par(mfrow=c(2,2))
