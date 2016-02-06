import re, os, math
from collections import defaultdict

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
#    for key in keys:
#        if key == str('42.00000'):
#            print i_number, out_matrix[i_number][key][0]
    #print i_number, min_I, min_rad, keys[ind]
    print i_number, keys[ind]
#for key in sorted(out_matrix[799].keys()):
#    print key+'\t'+out_matrix[799][key][0]

###BELOW IS NOT IN USE ???
#    for x in radius:
#        x=float(x)
#        if round(x,3) == float(min_rad):
#            keys=out_matrix[i_number].keys()
#            ind=radius.index(str(x))
#            print keys[ind]
            
            
