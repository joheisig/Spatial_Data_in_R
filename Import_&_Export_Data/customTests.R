# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

getState <- function(){
  environment(sys.function(1))$e
}

getVal <- function(){
  getState()$val
}

getExpr <- function(){
  getState()$expr
}

one_is_true <- function(x){
  ok <- TRUE %in% x
  exists('ok') && isTRUE(ok)
}

test_writeRaster <- function(){
  tifs <- list.files(pattern='.tif$')
  tifs.test<- list()
  try({
  for (i in tifs){   # search for all .tif files in wd and check if they meet requirements
    r <- raster(i)
    t1 <- r@data@min > 3200
    t2 <- r@data@max > 14400
    t3 <- r@extent@xmin < 586300 & r@extent@xmax > 602400
    tifs.test <- append(tifs.test, all(t1,t2,t3))
  }
}, silent = TRUE)
  rm(i, tifs, r, t1, t2, t3)
  one_is_true(tifs.test)
}


test_read_shp <- function(){
  n1.test <- readOGR("nightclubs_zurich.shp")
  n1.student <- get('n1', globalenv())
  t1 <- all(n1.test@data == n1.student@data)
  t2 <-  as.character(crs(n1.student)) == as.character(crs(n1.test))
  rm(n1.student, n1.test)
  all(t1,t2)
}

test_read_csv <- function(){
  n2.student <- get('n2', globalenv())
  t1 <- all(names(n2.student) == c("osm_id","name","type","x","y"))
  t2 <-  unique(n2.student$type) == 'nightclub'
  rm(n2.student)
  all(t1,t2)
}

test_SPDF <- function(){
  n3.student <- get('n3', globalenv())
  t1 <- class(n3.student) == "SpatialPointsDataFrame"
  t2 <-  unique(n3.student$type) == 'nightclub'
  t3 <- is.na(n3.student@proj4string)
  rm(n1.student)
  all(t1,t2,t3)
}

test_crs <- function(){
  n3.crs.student <- get('n3', globalenv())
  t1 <- as.character(crs(n3.crs.student)) == "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"
  rm(n3.crs.student)
  all(t1)
}

test_write_shp <- function(){
  shps <- list.files(pattern=glob2rx("*loc*.shp"))
  shp.test <- readOGR("nightclubs_zurich.shp")
  t1 <- class(n3.student) == "SpatialPointsDataFrame"
  t2 <-  unique(n3.student$type) == 'nightclub'
  t3 <- is.na(n3.student@proj4string)
  rm(n1.student)
  all(t1,t2,t3)
}
# alternative test: get last expr and get shp from layer name in write command



