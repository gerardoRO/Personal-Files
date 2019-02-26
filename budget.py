import pandas as pd

class ExpenseAnalysis():

    #pre defined categories of purchase types. Helps sort the different categories of expenses
    categories={'Insurance':['insurance'],
            'Utilities':['utilities'],
            'Memberships':['mnufc','mbp','wsj','nyt'],
            'One Time Expenses': ['tuition'],
            'Rent':['rent'],
            'Food':['restaurants','groceries','coffee','snacks'],
            'Fun':['bars','miscellaneous','snacks','entertainment'],
            'Transportation':['transportation','gas']
              }

    def __init__(self,path_to_budget):
        self.path_to_budget = path_to_budget

    def extract_expense_list(self):
        table_transactions = pd.read_csv(self.path_to_budget,
                            usecols=['Expense','Income','Category'])
        table_transactions['Category'] = table_transactions['Category'].apply(
            lambda x: x.lower()) #make all categories lower case for easier matching
        
        self.monthly_transactions = {}
        for transaction_type in table_transactions['Category'].unique(): #iterate through all 
            trans = table_transactions.loc[
                table_transactions['Category'] == transaction_type] #find all matching 
            total_transaction = trans['Expense'].sum() - trans['Income'].sum() #subtract income from expense
            self.monthly_transactions[transaction_type] = total_transaction #add to dictionary

    def sort_expenses(self,categories=None):
        if categories == None:
            categories = self.categories
        self.expenses =self.categories.fromkeys(list(self.categories),0) 
        for cat,items in self.categories.items(): #iterate through all posible categories
            for item in items:
                for expense in list(self.monthly_transactions): 
                    if expense == item: #compare the monthly transactions with the pre-defined categories
                        self.expenses[cat] += self.monthly_transactions[item] #add up all of the transactions
