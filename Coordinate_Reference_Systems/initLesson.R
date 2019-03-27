# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

#rm(list=ls())

list.of.packages <- c("raster", "rgdal", "mapview")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
new.packages <- append(new.packages, list.of.packages[(list.of.packages %in% old.packages()[,"Package"])])
if(length(new.packages)) install.packages(new.packages, quiet = TRUE)

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

path <- file.path(.get_course_path(), 'Spatial_Data_in_R/Coordinate_Reference_Systems')
setwd(path)


par(pch=19, col='red', lwd=1.5)

library(rgdal); library(raster); library(mapview)


oz.wgs <- readRDS("oz.wgs.R")
oz.gda <- readRDS("oz.gda.R")
oz.ch <- readRDS("oz.ch.R")
oz.cities <- readRDS("oz.cities.R")


ny <- readRDS("ny.R")
mapview::mapview(ny)

sl <- ny[1,2:3]
cp <- ny[2,2:3]

mt_rainier <- raster("mt_rainier_subset.tif")


rm(list.of.packages, new.packages)
