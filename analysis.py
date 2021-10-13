import os
import pandas as pd
import statsmodels.api as sm


if __name__ == "__main__":
    combined_csv = pd.concat([pd.read_csv(f"./data_cities/{f}") for f in os.listdir("./data_cities")])
    combined_csv = combined_csv.dropna()
    print(combined_csv)
    Y = combined_csv['debt']
    X = combined_csv.drop(['year', 'Year', 'debt', 'debtpp', 'socialwalfarepp', 'revenuepp'], axis=1)
    X2 = sm.add_constant(X)
    est = sm.OLS(Y, X2)
    est2 = est.fit()
    print("Linear regression")
    print(est2.summary())
    fi = open('./Results/OLS_Python_debt.txt', 'w')
    fi.write(f"{est2.summary()}")
    fi.close()


    combined_csv = pd.concat([pd.read_csv(f"./data_cities/{f}") for f in os.listdir("./data_cities")])
    combined_csv = combined_csv.dropna()
    print(combined_csv)
    Y = combined_csv['debtpp']
    X = combined_csv.drop(['year', 'Year', 'debt', 'debtpp', 'socialwalfare', 'revenue'], axis=1)
    X2 = sm.add_constant(X)
    est = sm.OLS(Y, X2)
    est2 = est.fit()
    print("Linear regression")
    print(est2.summary())
    fi = open('./Results/OLS_Python_debtpp.txt', 'w')
    fi.write(f"{est2.summary()}")
    fi.close()