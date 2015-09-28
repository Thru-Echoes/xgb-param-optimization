## XGB param optimization

Use of [eXtreme Gradient Boosting](https://github.com/dmlc/xgboost) (XGBoost / XGB) with minor
tweaks and modifications to enhance binary prediction abilities.
Specifically interested in low sample size and messy data.

Part of a larger methods project analyzing prediction abilities
with lowest (human) effort and highest yield within binary
classification problems.

Question:
How can we minimize time and effort while also obtaining the
greatest level of prediction power that is meaningful,
generalizable, and practical for non-computational researchers
to use?      

### General Overview of XGBoost

XGBoost incorporates some statistical elements from the following sources:

###### Additive Logistic Regression a Statistical View of Boosting
    Author: J. H. Friedman, T. Hastie, R. Tibshirani

    This paper uses second-order statistics for tree splitting - a similar
    method is used in XGB.

###### Greedy Function Approximation: a Gradient Boosting Machine
    Author: J. H. Friedman

    This is the first paper about gradient boosting. It is very lengthy
    and breaks down a range of topics in great detail. Including -
    basic function estimation, numerical optimization in function
    space (non-parametric), optimization in data space, regularization,
    and much, much more.


###### Basic info on boosting and XGB:

    If nrounds = 100, model of 100 trees is built. Each tree is
    built by the dataset being divided recursively several times.
    End product is groups of observations.

        - Each division operation = split.
        - Each group at each split = branch.
        - Deepest branch = leaf.

    NOTE: not all splits are equally important
    (& boosting = adding weighted models).

        - Gain = improvement through each split
        - Each split is done on one feature only at one value.

### Files

1. binaryXgb.r
    * R code for XGBoost training, cross-validation, and testing for binary input data
2. paramLin.r
    * R command for random parameter searching for linear boosted XGB models
    * Calculates the min mean error and index of the respective boosting round  
3. paramTree.r
    * R command for random parameter searching for tree boosted XGB models
    * Calculates the min mean error and index of the respective boosting round
4. rasterXgb.r
    * R command(s) for use of raster data in XGB binary prediction

### Use

*paramTree()* and *paramLin()* can be used to return a set of randomly generated parameters for tree boosted and linear boosted XGB runs, respectively.

Example Usage:

    # Generate 10k random parameter sets for linear boosting
    params10k_lin <- lapply(1:10000, function(i) {
        print("Linear status: ")
        print(i)
        paramLin()
    })

    # Generate 10k random parameter sets for tree boosting
    params10k_tree <- lapply(1:10000, function(i) {
        print("Tree status: ")
        print(i)
        paramTree()
    })

Optimal Param Search:

    # Find optimal params from min mean and index
    allMeans <- lappy(1:10000, function(i) {
    	params10k_lin[[i]]$minMean
    })

    # display params for lowest mean error
    params10k_lin[[which.min(allMeans)]]

Alternative - Param Search:

    # Split runs into 10x1k for intermediate variable storage
    params1k_lin1 <- lappy(1:1000, function(i) {
        print("Linear status: ")
        print(i)
        paramLin()
    })

    params1k_lin2 <- lappy(1:1000, function(i) {
        print("Linear status: ")
        print(i)
        paramLin()
    })

    ...

    params1k_lin10 <- ...

    # Store intermediate min error mean values and params

    linMeans <- vector()

    means1 <- lappy(1:1000, function(i) {
        params1k_lin1[[i]]$minMean              
    })

    linMeans <- c(linMeans, params1k_lin1[[which.min(means1)]])

    means2 <- lappy(1:1000, function(i) {
        params1k_lin2[[i]]$minMean              
    })

    linMeans <- c(linMeans, params1k_lin2[[which.min(means2)]])

    ...

    # linMeans now contains the params for lowest mean error
    # for 10 different 1k Linear boosted XGB models
    linMeans <- c(linMeans, params1k_lin10[[which.min(means10)]])


### Potential To Do
- [ ] Alt param search with gridsearch ([Caret R](http://machinelearningmastery.com/tuning-machine-learning-models-using-the-caret-r-package/))
- [ ] Rerun linear boosted parameter optimization methods with extra linear boosting parameters (i.e. lambda, alpha, lambda_bias)

### Resources

* [XGB in Kaggle - Otto](https://www.kaggle.com/tqchen/otto-group-product-classification-challenge/understanding-xgboost-model-on-otto-data/notebook)

* [Swanky XGB Tutorial](https://github.com/dmlc/xgboost/blob/master/R-package/vignettes/xgboostPresentation.Rmd)

* [Swanky XGB Tutorial 2](https://github.com/dmlc/xgboost/blob/master/R-package/vignettes/discoverYourData.Rmd)

* [Why Boosting Doesn't Overfit](http://jeremykun.com/2015/09/21/the-boosting-margin-or-why-boosting-doesnt-overfit/)
