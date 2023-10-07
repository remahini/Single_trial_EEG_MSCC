# Single_trial_EEG_MSCC
Single-trial EEG data holds repetitive neural information about the brain’s neurological activity, which is particularly important when creating a computational model to capture brain dynamics from similar datasets. Traditional EEG cluster analysis, especially EEG microstate analysis, has been extensively researched in clinical and cognitive neuroscience. However, the common practice of averaging trials to derive template maps from grand average ERP data may overlook important details of individual neural processes. This study aims to develop an effective clustering model based on multi-set consensus clustering and evaluate its reliability through error evaluation of scoring results.
The current toolbox offers a consensus clustering-based pipeline for treating single-trial EEG epoch and aim to identify interesting brain evoked response in individual subject level.
## How to reference
If you find this toolbox entirely or partially useful, please kindly reference the following articles:

[1] Mahini, R., Xu, P., Chen, G., Li, Y., Ding, W., Zhang, L.,... Qureshi, N. K., Hämä-läinen, T., Nandi, A. K., & Cong, F. (2022). Optimal Number of Clusters by Measuring Similarity Among Topographies for Spatio-Temporal ERP Analysis. Brain Topography. (URL)[https://doi.org/10.1007/s10548-022-00903-2]

[2] Mahini, R., Li, Y., Ding, W., Fu, R., Ristaniemi, T., Nandi, A. K., Chen, G., & Cong, F. (2020). Determination of the Time Window of Event-Related Potential Using Multiple-Set Consensus Clustering [Methods]. Frontiers in Neuroscience, 14(1047).(URL)[https://doi.org/10.3389/fnins.2020.521595]

[3] Mahini, R., Zhang, G., Parviainen, T., Düsing, R., Nandi, A. K., Cong, F., & Hämäläinen, T. (2023). Brain Evoked Response Qualification Using Multi-set Consensus Clustering: Toward Single-trial EEG Analysis. Submitted to Psycho-physiology available as a preprint at Authorea. (URL)[https://doi.org/10.22541/au.169600882.28722374/v1]


## How to use this toolbox
Please follow the steps below:

1- You need the EEGLAB toolbox installed on your computer pathed by Matlab (recommended version R2021b and upper versions).

2- You will need to path the directory after downloading to your Matlab with its subfolders.

3- You will need to run the "EEG_MSCC_Demo.m" main script. it will access all the included functions in the directory.

I hope you find it useful. You are welcome to review and let us know your thoughts.

Please contact us at:

remahini@jyu.fi
