### XGB param optimization

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
