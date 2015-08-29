## XGB param optimization

### General Overview

XGBoost incorporates some statistical elements from the following sources:

###### Additive Logistic Regression a Statistical View of Boosting
    *J. H. Friedman, T. Hastie, R. Tibshirani*
    This paper uses second-order statistics for tree splitting - a similar
    method is used in XGB.

###### Greedy Function Approximation: a Gradient Boosting Machine
    *J. H. Friedman*
    This is the first paper about gradient boosting. It is very lengthy
    and breaks down a range of topics in great detail. Including -
    basic function estimation, numerical optimization in function
    space (non-parametric), optimization in data space, regularization,
    and much, much more. 


######


### Notes

Use of XGB in R (xgboost R wrappers within RStudio). Minor tweaks and modifications
attempting to enhance predictive abilities of generic xgb runs. Part of a larger
project analyzing methods of lowest effort with highest yield. Primarily focused
on binary classification.

In other words: how can we minimize our time and effort while also obtaining
the greatest level of prediction that is practical and meaningful?  

### Use

paramSearch() can be used to return a set of param that were each randomly
chosen based on some variable-specific range.

Function arguments:

> paramSearch(nSet, isBoost, isVerb)

> nSet = number of param sets (NUMERIC)

> isBoost = use boost or not (BOOLEAN)

> isVerb = use of verbose in xgb for model output (0, 1, 2)

Example:
> param10 <- paramSearch(100, FALSE, 1)  

### To Do
- [ ] Automate paramSearch() with XGB runs
- [ ] Automate calculating lowest prediction value
- [ ] Cross-validate lowest prediction value (?)
- [ ] Obtain param set from paramSearch() with lowest (best) score
