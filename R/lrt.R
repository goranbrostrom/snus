lrt <- function(fit1, fit2){
   ## Note: Use on own risk: Models must be nested,
   ## but no check of that is made!
   ## 
   ## Result: p-value of H_0: smaller model OK.
   
   l1 <- logLik(fit1)
   l2 <- logLik(fit2)
   tv <- as.numeric(abs(2 * (l1 - l2)))
   d1 <- attr(l1, "df")
   d2 <- attr(l2, "df")
   p <- pchisq(tv, df = abs(d1 - d2), lower.tail = FALSE) 
   p
}