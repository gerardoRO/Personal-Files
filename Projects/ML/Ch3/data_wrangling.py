import pandas as pd
import numpy as np

def cleanup_column_names(data,rename_dict={},do_inplace=True):
    if not rename_dict:
        return data.rename(columns={col: col.lower().replace(' ','_') \
                                    for col in data.columns},inplace=do_inplace)
    else:
        return data.rename(columns=rename_dict,inplace=do_inplace)


def expand_user_type(u_type):
    if u_type in ['a','b']:
        return 'new'
    elif u_type  == 'c':
        return 'existing'
    elif u_type == 'd':
        return 'loyal_existing'
    else:
        return 'error'


def main():
    
    dt = pd.read_csv('sample_data.csv')
    cleanup_column_names(dt)
    dt['user_class'] = dt['user_type'].map(expand_user_type)
    dt['date'] = pd.to_datetime(dt.date)
    dt['purchase_week'] = dt[['date']].applymap(lambda dt: dt.week \
                                                            if not pd.isnull(dt.week) else 0)

    #Get rid of NaNs
    dt.dropna(subset=['date'],inplace=True)

    dt['price'].fillna(value=np.mean(dt.price),inplace=True)
    dt['user_type'].fillna(method='ffill',inplace=True)
    

    #Methods for encoding qualitative data
    type_map = {'a':0,'b':1,'c':2,'d':3,np.NAN:-1}
    #map based encoding method
    dt['encoded_user_type']= dt.user_type.map(type_map)
    print(dt.head())

    #one hot encoding method (creates a binary list for each type
    print((pd.get_dummies(dt,columns=['user_type'])).head())

    return dt
