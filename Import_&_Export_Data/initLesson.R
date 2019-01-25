# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

#rm(list=ls())

list.of.packages <- c("raster", "rgdal", "mapview")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
new.packages <- append(new.packages, list.of.packages[(list.of.packages %in% old.packages()[,"Package"])])
if(length(new.packages)) install.packages(new.packages)

.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

path <- file.path(.get_course_path(), 'Spatial_Data_in_R/Import_&_Export_Data')
setwd(path)




# delete .tif files created in earlier trials of this lesson
tifs <- list.files(pattern = '.tif')

for (i in tifs){ 
  if (file.exists(i)==T){
    file.remove(i)
  }
}

# delete nightclub_locations.shp created in earlier trials of this lesson
locs <- list.files(pattern = 'location')

for (i in locs){ 
  if (file.exists(i)==T){
    file.remove(i)
  }
}


#if (dir.exists('results') == TRUE){
#  unlink('results', recursive = T)
#}
#dir.create('results')

library(mapview)

