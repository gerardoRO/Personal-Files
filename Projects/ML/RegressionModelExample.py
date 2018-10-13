#!/usr/bin/python3
from sklearn import datasets, linear_model
from sklearn.model_selection import GridSearchCV
import numpy as np


diabetes = datasets.load_diabetes()
X_train = diabetes.data[:310]
X_test = diabetes.data[310:]
y_train = diabetes.target[:310]
y_test = diabetes.target[310:]

feature_names = ['age', 'sex', 'bmi', 'bp', 's1', 's2', 's3', 's4', 's5','s6']

lasso = linear_model.Lasso(random_state=0)
alphas = np.logspace(-4, -0.5, 30)

estimator = GridSearchCV(lasso, dict(alpha=alphas))
estimator.fit(X_train,y_train)

