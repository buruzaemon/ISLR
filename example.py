# -*- coding: utf-8 -*-
import numpy as np
import pandas as pd
from scipy.sparse import coo_matrix

data = [4,2,3,1]
i = [2,1,1,0]
j = [3,1,2,0]

m = coo_matrix((data, (i,j)), shape=(3,4))
#print(m.todense())

data = {}
data[0] = [1,0,1]
data[1] = [0,1,0]
data[2] = [0,0,1]
df = pd.DataFrame(data)
df = df.T
df.columns = list('ABC')
#print(df)

users = [0,1,2]
row = 0
data = []
i, j = [], []
offset_a = 0
offset_b = offset_a + 1
offset_c = offset_b + 1
offset_other = offset_c + 1
for u in users:
    tmpdf = df.ix[u]
    a = tmpdf.A
    b = tmpdf.B
    c = tmpdf.C
    for r_ix in range(m.shape[0]):
        curr_row = row*df.shape[0] + r_ix
        i.append(curr_row)
        j.append(offset_a)
        data.append(a)
        
        i.append(curr_row)
        j.append(offset_b)
        data.append(b)
        
        i.append(curr_row)
        j.append(offset_c)
        data.append(c)
        
        checkvalues = (m.getrow(r_ix).toarray()>0)[0]
        for ix,v in enumerate(checkvalues):
            if v:
                i.append(curr_row)
                j.append(offset_other+ix)
                data.append(m.getrow(r_ix).getcol(ix).toarray()[0][0])
        
    row += 1

mm = coo_matrix((data, (i,j)), shape=(df.shape[0]*m.shape[0], 
                                      df.shape[1]+m.shape[1]))
print(mm.todense())
