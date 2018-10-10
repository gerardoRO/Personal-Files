def DataPreProcessing(fileName):

    import numpy as np
    import matplotlib as plt
    import pandas as pd


    dataset = pd.read_csv(fileName)
    X = dataset.iloc[:,:-1].values
    y = dataset.iloc[:,3].values

    from sklearn.cross-validation import train_test_split
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = .2, random_state = 0)

    return X_train, X_test, y_train, y_test
