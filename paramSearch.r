# Generate random param set for XGB

paramSearch <- function(nSet, isBoost, isVerb) {

    param <- list("objective" = "binary:logistic",
                "max.depth" = 6,
                "eta" = 0.1,
                "nround" = 100,
                "verbose" = 2,
                "booster" = "gblinear")
    paramList <- list()

    # Random in var ranges
    for (i in seq(nSet)) {
        param$max.depth <- sample(3:7, 1, replace=T)
        param$eta <- runif(1, 0.01, 0.6)
        param$nround <- round(runif(1, 50, 500))
        paramList[[i]] <- param
    }

    # to boost or nah
    if (!isBoost) {
        param$booster <- FALSE
    }

    # what verbose?
    if (isVerb == 1) {
        param$verbose = 1
    } else if (isVerb == 0) {
        param$verbose = 0
    }

    return(paramList)
}

# use:
# param100 <- paramSearch(100)

# name files with specific param selections:
cntr <- 0
for (i in 1:param100) {
    nam <- paste("xgb-param", i, sep="")
    assign(nam, rnorm(3) + cntr)
}
