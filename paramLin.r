# Generate random param set for linear boosted

paramLin <- function() {

  param <- list("objective" = "binary:logistic",
                "max.depth" = 6,
                "eta" = 0.1,
                "gamma" = 0,
                "min_child_weight" = 1,
                "nthread" = 8,
                "lambda" = 0.0
                "alpha" = 0.0,
                "lambda_bias" = 0.0,
                "booster" = "gblinear")
  allResults <- vector()

  # Random parameter assignment
  param$max.depth <- sample(3:7, 1, replace=T)
  param$eta <- runif(1, 0.01, 0.6)
  param$gamma <- runif(1, 0.0, 100)
  param$min_child_weight <- runif(1, 0.0, 100)
  param$lambda <- 1.0
  param$alpha <- 1.0
  param$lambda_bias <- 1.0

  # cross validation
  cv.nround = 1000
  bst <- xgb.cv(param=param, data=x[trind,], nfold=3, label=y, nrounds=cv.nround, verbose=0)

  # Find min mean error and respective index
  minMean <- min(bst[, test.error.mean])
  idxMinMean <- which.min(bst[, test.error.mean])

  # Write out results
  cvParam <- list("max.depth" = param$max.depth,
                  "eta" = param$eta,
                  "min_child_weight" = param$min_child_weight,
                  "lambda" = param$lambda,
                  "alpha" = param$alpha,
                  "lambda_bias" = param$lambda_bias,
                  "minMean" = minMean,
                  "idxMinMean" = idxMinMean)
  allResults <- c(allResults, cvParam)
  return(allResults)
}
