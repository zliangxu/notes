[scikit-learn](http://scikit-learn.org/stable/tutorial/basic/tutorial.html)

## model learning
<!--模型加载-->
model = METHOD( parameter )
<!--训练模型-->
model.fit(X_train, Y_train) 
<!--模型预测-->
Y_proba = model.predict(X_test)

## model persistence 模型保存
```python
# pickle
import pickle
s = pickle.dumps(clf)
clf2 = pickle.loads(s)

# joblib
from sklearn.externals import joblib
joblib.dump(clf, 'filename.pkl') 
clf = joblib.load('filename.pkl') 
```
## conventions
<!--cast 数据类型转换-->
X_new = transformer.fit_transform( X )???
<!--refitting and updating parameters-->



## model [selection](http://scikit-learn.org/stable/tutorial/statistical_inference/model_selection.html)
<!--就是尝试了K次训练-->
KFold cross-validation  
<!--cross-validation generators-->
<!--grid search-->