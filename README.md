# Matlabh-project-image
This code efficiently demonstrates how to preprocess ECG data, extract features, and classify signals using machine learning in MATLAB.

Trimming ECG Data:
This code imports two ECG signals—one normal and one abnormal—from CSV files. It ensures both signals are the same length by trimming the longer signal, which allows for consistent analysis and processing.

Adding Noise and Filtering:
To simulate real-world data conditions, random noise is added to both signals. A Butterworth high-pass filter is then applied to remove low-frequency noise, isolating relevant frequency components in the ECG signal.

Feature Extraction:
Statistical features, such as mean, standard deviation, skewness, and kurtosis, are extracted from the filtered ECG signals. These features provide insights into the signal characteristics and are essential for classification.

Neural Network Classification:
The extracted features are input into a neural network classifier with a single hidden layer containing 10 neurons. The network is trained to distinguish between normal and abnormal ECG patterns, with labels set as 0 (normal) and 1 (abnormal).

Performance Evaluation:
The neural network's predictions are compared to true labels to evaluate accuracy, with results displayed in the command window. This step provides immediate feedback on the model’s classification performance, showing predicted labels, true labels, and overall accuracy.

<img width="332" alt="image" src="https://github.com/user-attachments/assets/9a34213f-2a17-4d05-a3ce-2bb92265a68f">


<img width="375" alt="image" src="https://github.com/user-attachments/assets/1be9fbec-0b50-4ead-881d-fe5338b5a10f">


<img width="439" alt="image" src="https://github.com/user-attachments/assets/86e2e017-2b39-4398-baf7-f0bfa2fe8912">


<img width="438" alt="image" src="https://github.com/user-attachments/assets/a9155a31-3399-47d4-8072-6cc27987674f">
