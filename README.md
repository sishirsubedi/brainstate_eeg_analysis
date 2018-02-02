# brainstate_eeg_analysis

Systematic Analysis of Machine Learning Algorithms
on EEG Data for Brain State Intelligence


Electroencephalography (EEG) is a highly promising medium for brain-computer interfaces (BCI) with potentially extraordinary
applications such as the direct control of prosthetics and exoskeletons. However, effective analysis and modeling of EEG data has been
limited by its poor spatial resolution. EEG’s low amplitude, brief and sporadic nature, compounded by extra-cranial noise, contribute to
the difficulty of this problem. This systematic analysis provides strong evidence to guide future research in machine learning applied to
real-time analysis of brain states using EEGs. The main goal of this research is to understand how the construction of data sets used in
training models affects the accuracy of prominent machine learning algorithms, specifically: Random Forest, Boosting, Naïve Bayesian
Classifier, k-Nearest Neighbors (KNN) and Support Vector Machine (SVM). Herein, we present a systematic method (N = 153) to test
the accuracy of prominent machine learning algorithms when varying three main components of the training data set: the permutations
of subjects, the number of unique data sets used to generate the training data set, and the number of samples in each training data set.
Our results strongly indicate that Random Forest consistently yields superior results when analyzing EEG data compared to other
prominent machine learning algorithms. Furthermore, a pilot investigation was conducted on a mean-normalized feature for EEG data
analysis. The pilot analysis (N = 28) confirmed Random Forest’s analytical superiority in EEG data, shows signs of improved accuracy,
and identifies a distinctive correlation between beta and delta waves and their respective active or idle brain states.