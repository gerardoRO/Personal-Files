# -*- coding: utf-8 -*-
"""
Created on Wed Oct 10 19:16:34 2018

@author: gerar
"""

import pandas as pd

dataSet = pd.read_csv('student_records.csv')
featureNames = ['OverallGrade' , 'Obedient' , 'ResearchScore' , 'ProjectScore']
trainingFeatures = dataSet[featureNames]

outcome = ['Recommend']
outcome_label = dataSet[outcome]

#Separate data set into data types
numeric_features = ['ResearchScore' , 'ProjectScore']
categorical_features = ['OverallGrade' , 'Obedient']

#Normalization of the numerical dataset
from sklearn.preprocessing import StandardScaler
ss = StandardScaler()

ss.fit(trainingFeatures[numeric_features])
trainingFeatures[numeric_features] = ss.transform(trainingFeatures[numeric_features])

#Normalization of categorical dataset
trainingFeatures = pd.get_dummies(trainingFeatures,columns=categorical_features)

#Create logisitic model
from sklearn.linear_model import LogisticRegression
import numpy as np

lr = LogisticRegression()
model = lr.fit(trainingFeatures,np.array(outcome_label['Recommend']))

#Model Evaluation
pred_labels = model.predict(trainingFeatures)
actual_labels = np.array(outcome_label['Recommend'])

from sklearn.metrics import accuracy_score, classification_report

print('Accuracy', float(accuracy_score(actual_labels,pred_labels))*100,'%')
print('ClassificationStats:')
print(classification_report(actual_labels,pred_labels))

#Testing on Data
new_data = pd.DataFrame([{'Name': 'Nathan','OverallGrade': 'F','Obedient':'N','ResearchScore':30,'ProjectScore':20},{'Name':'Thomas','OverallGrade':'A','Obedient':'Y','ResearchScore':78,'ProjectScore':80}])
predictionFeatures = new_data[featureNames]
predictionFeatures[numeric_features]=ss.transform(predictionFeatures[numeric_features]) 
predictionFeatures = pd.get_dummies(predictionFeatures,columns=categorical_features)

#Add missing features
missingFeatures = set(trainingFeatures.columns)-set(predictionFeatures.columns)
for feature in missingFeatures:
    predictionFeatures[feature] = 0
    
#Predict
predictions = model.predict(predictionFeatures)
new_data['Recommend'] = predictions
