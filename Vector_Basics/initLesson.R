# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

rm(list = ls())

list.of.packages <- c("raster", "rgdal", "rgeos", "sp", "sf")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
new.packages <- append(new.packages, list.of.packages[(list.of.packages %in% old.packages()[,"Package"])])
if(length(new.packages)) install.packages(new.packages)

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

try({
  library(raster);library(rgdal);library(rgeos);library(sf);library(sp);
  # data folder
  loc <- "Spatial_Data_in_R/Vector_Basics/data"
  
  ch <- readOGR(file.path(.get_course_path(), loc, "CHE_adm0.shp"), verbose = FALSE)
  z <- readOGR(file.path(.get_course_path(), loc, "CHE_adm1_zurich.shp"), verbose = FALSE)
  z.nat <- readOGR(file.path(.get_course_path(), loc, "natural_zurich.shp"), verbose = FALSE) 
  z.lakes <- subset(z.nat, type=="water")
  z.poi <- readOGR(file.path(.get_course_path(), loc,"points_zurich.shp"), verbose = FALSE)
  z.roads <- readOGR(file.path(.get_course_path(), loc, "roads_zurich.shp"), verbose = FALSE)
  z.streams <- readOGR(file.path(.get_course_path(), loc, "waterways_zurich.shp"), verbose = FALSE)
  
  z.ras <- raster(ext=extent(z), crs=crs(z), resolution=50)
  values(z.ras) <- 1
  
  dev.off()
  plot(ch, main="Switzerland")
  lines(z, col="red")
  
  par(mfrow=c(2,2))
  
  rm(loc, list.of.packages, new.packages)
})