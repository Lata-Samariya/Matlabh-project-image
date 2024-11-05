% Load normal and abnormal ECG data from CSV files
normal_ecg = csvread('ecg.csv');  % Replace with your file path
abnormal_ecg = csvread('mitbih_test.csv');  % Replace with your file path

% Ensure both signals are of the same length (e.g., trim longer one)
min_length = min(length(normal_ecg), length(abnormal_ecg));
normal_ecg = normal_ecg(1:min_length);
abnormal_ecg = abnormal_ecg(1:min_length);

% Define parameters for processing
fs = 360;  % Sampling frequency, typical for ECG signals from MIT-BIH
cutoff_freq = 0.5;  % Cutoff frequency for high-pass filter
order = 2;  % Order of the Butterworth filter

% Add random noise to the ECG signals
noise_level = 0.05;  % Noise level, adjust based on requirements
normal_ecg_noisy = normal_ecg + noise_level * randn(size(normal_ecg));
abnormal_ecg_noisy = abnormal_ecg + noise_level * randn(size(abnormal_ecg));

% Design a Butterworth high-pass filter
[b, a] = butter(order, cutoff_freq / (fs / 2), 'high');

% Filter the noisy ECG signals
normal_ecg_filtered = filtfilt(b, a, normal_ecg_noisy);
abnormal_ecg_filtered = filtfilt(b, a, abnormal_ecg_noisy);

% Feature extraction function (ensure consistent number of features)
extract_features = @(signal) [mean(signal), std(signal), ...
                              skewness(signal), kurtosis(signal), ...
                              max(signal), min(signal)];

% Extract statistical features
normal_features = extract_features(normal_ecg_filtered);
abnormal_features = extract_features(abnormal_ecg_filtered);

% Combine features into a dataset (features now have consistent dimensions)
features = [normal_features; abnormal_features];
labels = [0; 1];  % 0 for normal, 1 for abnormal

% Neural Network Classifier
% Define the structure of the neural network
net = feedforwardnet(10);  % 10 hidden neurons, adjust as needed

% Train the neural network
net = train(net, features', labels');

% Test the classifier
predicted_labels = net(features');

% Display results
fprintf('Predicted Labels:\n');
disp(round(predicted_labels));
fprintf('True Labels:\n');
disp(labels);
accuracy = sum(round(predicted_labels) == labels') / numel(labels);
fprintf('Classification Accuracy: %.2f%%\n', accuracy * 100);
