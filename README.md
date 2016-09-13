# Application of k-means clustering in psychological studies

This repository contains raw data and the script for the paper:

Zakharov, Kyrylo (2016) Application of k-means clustering in psychological studies, The Quantitative Methods for Psychology, 12(2), 87-100. doi: [10.20982/tqmp.12.2.p087](http://dx.doi.org/10.20982/tqmp.12.2.p087)

## Codebook

* author - Author of the publication
* title - Publication title
* year - Year of publication
* k-means - Application of K-means (1 - true / 0 - false)
* levels_num - Number of raw variables used in K-means
* tests_num - Number of psychological tests used in the publication
* cluster_num - Number of clusters
* sample - Sample size for clustering
* raw_desc - Description of the raw (1 - true / 0 - false)
* ierarch - Ierarchical clustering used for defining number of clusters  (1 - true / 0 - false)
* normalize - Preliminary data normalization  (1 - true / 0 - false)
* pre_fa_pca - Preliminary Factor Analysis or Principal Component Analysis (1 - true / 0 - false)
* descriptive - Descriptive statistics of groups by K-means is presented
* t_student - T Student's test was used for validation of clustering
* anova - ANOVA is used for validation of clustering
* fishers_phi - Fisher's phi was used for validation of clustering
* post_fa - Factor analysis is used to clustered data
* h_k_w - Kruskal-Wallis Test was used for validation of clustering
* u_mw - Mann-Whitney-Wilcoxon Test was used for validation of clustering
* external_vaildation - External validation was applied
* soft - Software used for clustering
* argument - Rationale for number of clusters
* full_citation - Full citation of publication
* extra - Extra information (few samples, few types of validation etc.)
