green <- function(dat){
   ## Assume no missing values
    ## dat innehåller mat24, mat25, ..., mat29
    ## kodade:
    ##
    ## 0 --> 0
    ## 1 --> 1/365 * 7 (= 0.019)
    ## 2 --> 2 * 12/365 * 7 (= 0.46)
    ## 3 --> 1
    ## 4 --> 2.5
    ## 5 --> 5
    ## 6 --> 7
    ## 7 --> 17.5
    ## 8 --> 28

    newvalue <- function(x){
        ## x <- any of mat24, mat25, ..., mat29
        ## coded 0-8, see above.
        y <- rep(NA, length(x))
        
        y[x == 0] <- 0
        y[x == 1] <- 7 / 365
        y[x == 2] <- 168 / 365
        y[x == 3] <- 1
        y[x == 4] <- 2.5
        y[x == 5] <- 5
        y[x == 6] <- 7
        y[x == 7] <- 17.5
        y[x == 8] <- 28
        ##
        y
    }

    names <- paste0("perweek", 24:29)
    oldnames <- paste0("mat", 24:29)
    nr <- 0
    for (col in names){
        nr <- nr + 1
        dat[, col] <- newvalue(dat[, oldnames[nr]])
    }
        
    dat$perweek <- rowSums(dat[, names])
    dat$green <- cut(dat$perweek, c(0, 14, 196), include.lowest = TRUE)
    dat
}
