import re, os, math
from collections import defaultdict
import numpy as np
from scipy import stats
#datadir='/Users/ozge/Documents/Analysis/3RIF_wGLU_wIVM/GluCl_wIVM_wGLU_pore/logs'
def f2(seq): 
   # order preserving
   checked = []
   for e in seq:
       if e not in checked:
           checked.append(e)
   return checked

datad=os.environ["datadir"]

minimum_frame={}

frame_list_dup=[]
for root, dirs, files in os.walk(datad):
    for data_f in files:
        i_name, i_ext= os.path.splitext(data_f)
        if re.match('.log', i_ext):
            frame_list_dup.append(data_f)
frame_list=f2(frame_list_dup)
minimum_radius=[{}for frame in frame_list]
out_matrix=[{}for frame in frame_list]
m_r_temp={}
outf=open("avg_9prime_radius.dat","w")
for frame in frame_list:
    nine_prime=[]
    i_name,i_ext=os.path.splitext(frame)
    i_number=i_name.translate(None,'frame_')
    i_number=int(i_number)
    with open(frame, 'r') as f:
        start_read=False
        for line in f:
            if line.startswith(' Minimum'):
                min_rad=line.split()[-2]
                m_r_temp[i_number]=min_rad
            if line.startswith(' cenxyz.cvec'):
                start_read=True
            elif line == '\n': 
                start_read=False
            if start_read:
                cenxyz=line.split()[0]
                rad=line.split()[1]
                check=line.split()[-1]
                if check == '(sampled)' or '(mid-point)' and not rad == 'radius':
                    out_matrix[i_number][cenxyz]=[rad]
    keys=out_matrix[i_number].keys()
    for key in keys:
       if float(key) in np.arange(44.5,49.5,0.5):
           nine_prime.append(float(out_matrix[i_number][key][0]))
    mean=np.mean(nine_prime)
    stdev=np.std(nine_prime)
    outf.write(str(i_number)+' '+str(mean)+' '+str(stdev)+'\n')
