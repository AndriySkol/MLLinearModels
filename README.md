# MLLinearModels

MLLinearModels is a small library tht provides functionality to train and use linear regression models, such as "Ordinary Least Squares", "Ridge", "Lasso", "Elastic Net".
This library consists of 4 main classes: 
* `RidgeModel` represents "Ridge" and "Ordinary least squares" models.
* `RidgeModelCV` represents a cross-validation procedure for "Ridge"/"OLS" models.
* `ElasticNetModel` represents "Lasso" and "Elastic Net" models.
* `ElasticNetModelCV` represents a cross-validation procedure for "Lasso" and "Elastic Net" models.

Both "RidgeModel" and "ElasticNetModel" provide:
* `fit:X to: y checkInput: check` message to train model, that accepts X as PMMatrix class and y as PMVector, checkInput specifies whether data given should be preprocessed.
* `predict: X` - returns a vector of predictions for matrix rows
* `score: X output: y`- evaluates R2 coeficient error of prediction, if y is a vector of true values

### Installation
In order to use this library, Polymath project is required to install. https://github.com/PolyMathOrg/PolyMath
In addition, DataFrame library is highly suggested (though not necessary) to manipulate data https://github.com/PolyMathOrg/DataFrame

### Loading data for the tutorial
We will load housing data and split it into train and test sets
```smalltalk
df := DataFrame loadHousing.
df addColumn: ((1 to: df size) collect:[:i | 100 random > 85]) named: #isTest.
 
trainX := (df  selectAllWhere: [:isTest | isTest not ]) columnsFrom: 1 to: 3.
trainY := (df  selectAllWhere: [:isTest | isTest not ]) columnAt: 4.
 
testX := (df  selectAllWhere: [:isTest | isTest  ]) columnsFrom: 1 to: 3.
testY := (df  selectAllWhere: [:isTest | isTest  ]) columnAt: 4.
```
In order, to interact with library though, we need to conver the dataframe data into PMMatrix class from Polymath.
```smalltalk
trainXMatrix := PMMatrix rows: trainX asArrayOfRows .
trainYVec := trainY asPMVector .
testXMatrix := PMMatrix rows: testX asArrayOfRows .
testYVec := testY asPMVector.
```
### Using RidgeModel
```smalltalk
olsModel :=
    RidgeModel new alpha: 0;
    shouldCenter: true;
    shouldNormalize: true.
 
olsModel fit: trainXMatrix to: trainYVec checkInput: true.
r2coeficient = olsModel score: testXMatrix output: testYVec.
mseError = (((olsModel predict: testXMatrix) - testYVec) inject: 0 into: [ :a :b | a + b squared ]) / tY size.
```

### Using ElasticNetModel
```smalltalk
lasso := ElasticNetModel new 
	shouldCenter: true;
   shouldNormalize: true;
   alpha: 6.36;
   tol: 1e-3.
   
lasso fit: trainXMatrix to: trainYVec checkInput: true.
lasso score: testXMatrix output: testYVec.
```
### Using RidgeModelCV
This class requires to pass and array of alpha values to choose from. 
nFolds - the number of groups to perform more efficient k-cross validation. 
if nFolds = nill or: nFolds = 1 - efficient leave-one-out cross validation is performed.
as a result of training this model will contain:
* model property - which will contain the best estimated ridge model;
* mses property - evaluated MSE for each alpha
* minAlpha - the best alpha 
* minMse - the smalles error that corresponds to minAlpha 
```smalltalk
ridgeCV := RidgeCVModel new
    shouldCenter: true;
    shouldNormalize: true;
    alphas: {1e-3 . 5e-3 . 1e-2 . 3e-2 . 5e-2 . 7e-2 . 1e-1 . 3e-1 .  5e-1. 1 . 5 . 10 . 20}.
 
ridgeCV fit: trainXMatrix to: trainYVec checkInput: true.
ridgeCVR2 = ridgeCV model score: testXMatrix output: testYVec.
```
