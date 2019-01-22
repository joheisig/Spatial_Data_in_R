# Put custom tests in this file.

      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.

       AUTO_DETECT_NEWVAR <- FALSE

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

test_subset <- function() {
 try({
   zf <- get('z.forests', globalenv())
   t1 <- identical(as.numeric(nrow(zf)), 1641)
   t2 <- identical(as.character(unique(zf$type)), 'forest')
   ok <- all(t1, t2)
 }, silent = TRUE)
 exists('ok') && isTRUE(ok)
}

test_graphic_par <- function() {
 try({
   p <- par()
   t1 <- identical(as.numeric(p$mfrow), c(1,1))
   ok <- all(t1)
 }, silent = TRUE)
 exists('ok') && isTRUE(ok)
}

test_plot_forest <- function() {
try({
   ex0 <<- as.character(getExpr())
   ex1 <- sub('"', "", sub('"', "", ex0))
   ex2 <- sub("'", "", sub("'", "", ex1))

   t1 <- one_is_true(grepl('plot', ex2))
   t2 <- one_is_true(grepl('z.forests', ex2))
   t3 <- one_is_true(grepl('lightgreen', ex2))

   ok <- all(t1, t2, t3)
 }, silent = TRUE)
 exists('ok') && isTRUE(ok)
}

test_area_forest <- function(){
    try({
       ex0 <<- as.numeric(getVal())
       t1 <- ex0 > 540
       t2 <- ex0 < 550
       ok <- all(t1, t2)
     }, silent = TRUE)
     exists('ok') && isTRUE(ok)
}

test_plot_lakes <- function() {
try({
   ex0 <<- as.character(getExpr())
   ex1 <- sub('"', "", sub('"', "", ex0))
   ex2 <- sub("'", "", sub("'", "", ex1))

   t1 <- one_is_true(grepl('plot', ex2))
   t2 <- one_is_true(grepl('z.lakes', ex2))
   t3 <- one_is_true(grepl('lightblue', ex2))

   ok <- all(t1, t2, t3)
 }, silent = TRUE)
 exists('ok') && isTRUE(ok)
}

test_lines_func <- function() {
try({
   ex0 <<- as.character(getExpr())
   ex1 <- sub('"', "", sub('"', "", ex0))
   ex2 <- sub("'", "", sub("'", "", ex1))
   
   t1 <- one_is_true(grepl('lines', ex2))
   tt2 <- c(grepl('z.streams', ex2), grepl('z.roads', ex2), grepl('z', ex2))
   t2 <- one_is_true(tt2)
   tt3 <- c(grepl('royalblue', ex2), grepl('orange', ex2), grepl('red', ex2))
   t3 <- one_is_true(tt3)
   t4 <- one_is_true(c(grepl('1.5', ex2), grepl('2', ex2)))
   ok <- all(t1, t2, t3, t4)
 }, silent = TRUE)
 exists('ok') && isTRUE(ok)
}

test_points_func <- function() {
try({
   ex0 <<- as.character(getExpr())
   ex1 <- sub('"', "", sub('"', "", ex0))
   ex2 <- sub("'", "", sub("'", "", ex1))
   t1 <- one_is_true(grepl('points', ex2))
   t2 <- one_is_true(grepl('15', ex2))
   t3 <- one_is_true(grepl('z.hospitals', ex2))
   ok <- all(t1, t2, t3)
 }, silent = TRUE)
 exists('ok') && isTRUE(ok)
}

test_subset2 <- function() {
 try({
   zh <- get('z.hospitals', globalenv())
   t1 <- identical(as.numeric(nrow(zh)), 18)
   t2 <- identical(as.character(unique(zh$type)), 'hospital')
   ok <- all(t1, t2)
 }, silent = TRUE)
 exists('ok') && isTRUE(ok)
}





