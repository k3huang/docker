from sklearn import linear_model
from sklearn.linear_model import LogisticRegression
import warnings
warnings.filterwarnings('ignore')

def ridge(battery5_cpp):
    X, y = battery5_cpp[['Battery Current Capacity (mWh)', 'Battery Rate (mW)', 'Battery Voltage (mv)']], \
       battery5_cpp['Battery estimatedTime (Seconds).']
    ridge = linear_model.Ridge(alpha=.5)
    ridge.fit(X, y)
    ridge_score = ridge.score(X, y)
    print(ridge_score)
    return ridge_score


def logistic(battery5_cpp):
    X, y = battery5_cpp[['Battery Current Capacity (mWh)', 'Battery Rate (mW)', 'Battery Voltage (mv)']], \
        battery5_cpp['Battery estimatedTime (Seconds).']
    logistic = LogisticRegression(random_state=0).fit(X, y)
    logistic_score = logistic.score(X, y)
    print(logistic_score)
    return logistic_score