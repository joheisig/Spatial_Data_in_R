# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
       AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.
       
       
       test_subset <- function() {
         try({
           zf <- get('z.forests', globalenv())
           t1 <- identical(as.numeric(nrow(zf)), 1641)
           t2 <- identical(as.character(unique(zf$type)), 'forest')
           ok <- all(t1, t2)
         }, silent = TRUE)
         exists('ok') && isTRUE(ok)
         options(warn=-1)
         rm(ok, t1, t2, zf)
         options(warn=0)
       }
       
       test_graphic_par <- function() {
         try({
           p <- par()
           t1 <- identical(as.numeric(p$mfrow), c(1,1))
           ok <- all(t1)
         }, silent = TRUE)
         exists('ok') && isTRUE(ok)
         options(warn=-1)
         rm(ok, t1)
         options(warn=0)
       }
       
       test_subset2 <- function() {
         try({
           zh <- get('z.hospitals', globalenv())
           t1 <- identical(as.numeric(nrow(zh)), 18)
           t2 <- identical(as.character(unique(zh$type)), 'hospital')
           ok <- all(t1, t2)
         }, silent = TRUE)
         exists('ok') && isTRUE(ok)
         options(warn=-1)
         rm(ok, t1, t2, zh)
         options(warn=0)
       }
       
