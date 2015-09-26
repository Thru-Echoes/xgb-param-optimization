## XGB param optimization

### General Overview

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

### Resources

* [XGB in Kaggle - Otto](https://www.kaggle.com/tqchen/otto-group-product-classification-challenge/understanding-xgboost-model-on-otto-data/notebook)

* [Swanky XGB Tutorial](https://github.com/dmlc/xgboost/blob/master/R-package/vignettes/xgboostPresentation.Rmd)

* [Swanky XGB Tutorial 2](https://github.com/dmlc/xgboost/blob/master/R-package/vignettes/discoverYourData.Rmd)


### Notes

Use of XGB in R (xgboost R wrappers within RStudio). Minor tweaks and modifications
attempting to enhance predictive abilities of generic xgb runs. Part of a larger
project analyzing methods of lowest effort with highest yield. Primarily focused
on binary classification.

In other words: how can we minimize our time and effort while also obtaining
the greatest level of prediction that is practical and meaningful?

###### Example:

    If nrounds = 100, model of 100 trees is built. Each tree is built by the dataset
    being divided recursively several times. End product is groups of observations.
    - Each division operation = split.
    - Each group at each split = branch.
    - Deepest branch = leaf.
    NOTE: not all splits are equally important (& boosting = adding weighted models).

    - Gain = improvement through each split
    - Each split is done on one feature only at one value.

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

### Potential To Do
- [ ] Alt param search with gridsearch ([Caret R](http://machinelearningmastery.com/tuning-machine-learning-models-using-the-caret-r-package/))
- [ ] Rerun linear boosted parameter optimization methods with extra linear boosting parameters (i.e. lambda, alpha, lambda_bias)
