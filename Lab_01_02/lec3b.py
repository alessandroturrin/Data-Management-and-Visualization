import numpy as np

#define initial parameters
n_bins = 10
n_compulsory_items = 3
n_non_compulsory_items = 4
#generate bin's costs
C = np.random.uniform(100,120,n_bins)
#generate item's profits
p = np.random.uniform(10,12,n_non_compulsory_items)
w = np.random.uniform(1,5,n_compulsory_items+n_non_compulsory_items)
W = np.random.uniform(20,40,n_bins)
