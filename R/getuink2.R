getuink2 <- function(dat){
   ## dat == linkom, typically
   who <- unique(dat$LopNr)
   nn <- length(who)
   oj <- rep(NA, nn)
   res <- data.frame(LopNr = oj, uincome = oj, lag = oj)
   i <- 0
   for (vem in who){
      i <- i + 1
      res$LopNr[i] <- vem
      per <- dat[dat$LopNr == vem, ]
      x <- getper(per)
      res$uincome[i] <- x[1]
      res$lag[i] <- x[2]
   }
   res
}

getper <- function(per){
    ## Skicka tillbaka income och lag i vektor (income, lag)
    per <- per[!is.na(per$income), ]
    n <- NROW(per)
    if (n == 0) return(c(NA, NA))
    if (per$us_ar[1] == 1989){
       lag <- -1
       income <- per$income[per$year == 1990]
    }else{
      per <- per[per$us_ar >= per$year, ]
      n <- NROW(per)
      if (n == 0) return(c(NA, NA))
      income <- per$income[n]
      lag <- per$us_ar[n] - per$year[n]
    }
    c(income, lag)
}
