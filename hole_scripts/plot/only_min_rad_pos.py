import re, os, math
from collections import defaultdict
import numpy as np
from scipy import stats

def f2(seq): 
   checked = []
   for e in seq:
       if e not in checked:
           checked.append(e)
   return checked

outype=os.environ["type"]
datad=os.environ["datadir"]
outname=open(os.environ["output"],"w")
llim=float(os.environ["llim"])
ulim=float(os.environ["ulim"])
step=float(os.environ["step"])

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

for frame in frame_list:
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
    min_rad=m_r_temp[i_number]
    radius=out_matrix[i_number].values()
    radius=sum(radius,[])
    radius=map(float, radius)
    min_I=min(radius)
    keys=out_matrix[i_number].keys()
    ind=radius.index(min_I)
    if outtype == "minrad":
       outname.write(str(i_number)+'\t'+str(min_I)+'\t'+str(keys[ind])+'\n')
    elif outtype == "region":
       region=[]
       for key in keys:
          if float(key) in np.arange(llim,ulim,step):
             region.append(float(out_matrix[i_number][key][0]))
       mean=np.mean(region)
       stdev=np.std(region)
       outname.write(str(i_number)+' '+str(mean)+' '+str(stdev)+'\n')
    else:
       continue

if outtype == "frame":
   time=int(os.environ["time"])
   for key in sorted(out_matrix[time].keys()):
      outname.write(str(key)+'\t'+str(out_matrix[time][key][0]+'\n')
