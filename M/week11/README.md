# Week 11
pipeline (E.g. Photo ORC pipeline)\
![image](https://user-images.githubusercontent.com/55611051/118221093-2e0bde80-b4a7-11eb-8454-1af6ce96536e.png)\
sliding windows\
![image](https://user-images.githubusercontent.com/55611051/118221113-37954680-b4a7-11eb-93ca-eae368d282fe.png)\
Artificial Data:\
-synthetic data: (e.g: interner font vs random background)\
![image](https://user-images.githubusercontent.com/55611051/118221141-41b74500-b4a7-11eb-9ca7-99f1f0e8df8f.png)\
-distortions:\
(image)\
![image](https://user-images.githubusercontent.com/55611051/118221167-4aa81680-b4a7-11eb-8506-e1860d9f86f3.png)\
(or audio)\
![image](https://user-images.githubusercontent.com/55611051/118221184-4f6cca80-b4a7-11eb-9d3e-7d6894240194.png)\
Discussion on getting more data:
-	Make sure you have a low bias classifier. If not, keep increase the number of features/ number of hidden units in neural network until you have a low bias classifier\
-	10x data?:
o	Artificial data synthesis\
o	Collect/label it yourself\
o	“Crowd source” (E.g. Amazon Mechanical Turk)
\
Ceiling Analysis:
![image](https://user-images.githubusercontent.com/55611051/118221365-a8d4f980-b4a7-11eb-91b3-29810fa94205.png)\
-85% means the current overall system has 85% accuracy.\
-if we change the output of the preprocess component with the ground truth label, overall system accuracy up from 85% to 85.1% (increase 0.1%).\
-if we change the output of the face detection with the ground truth label, overall system accuracy up from 85.1% (accuracy with 100% accuracy preprocess) to 91%.\
-and so on if we have ground truth label for logistic regression, overall system has 100% accuracy.

