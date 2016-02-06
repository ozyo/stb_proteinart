#!/usr/bin/env python
import sys, argparse
class params:
    def __init__(self):
        self.startr=int(sys.argv[2])
        self.endr=int(sys.argv[3])
        self.startn=sys.argv[4]
        self.ch=sys.argv[5]
    def clean_pdb(self):
        pdb_file=[]
        with open(sys.argv[1],'r') as file:
            for line in file:
                if line.startswith('ATOM'):
                    pdb_file.append(line)
        return pdb_file
params=params()
pdb_file=params.clean_pdb()
pdb_file[0]
new=int(params.startn)-1
new_pdb=open(params.ch+'.pdb','w')
for line in pdb_file:
    atom=line.split()
    chain=atom[4]
    resnr=int(atom[5])
    atomn=atom[2]
    if chain == params.ch and resnr >= params.startr and resnr <= params.endr:
        if atomn != 'N':
            atom[5]=str(new)
        else:
            atom[5]=str(new+1)
            new=new+1
        new_pdb.write('%s  %5s  %-4s%3s%2s%4s%12s%8s%8s%6s%6s%12s\n' %(atom[0],atom[1],atom[2],atom[3],atom[4],atom[5],atom[6],atom[7],atom[8],atom[9],atom[10],atom[11]))
        prev_nr=resnr
    else:
        if chain == params.ch:
            new_pdb.write('%s  %5s  %-4s%3s%2s%4s%12s%8s%8s%6s%6s%12s\n' %(atom[0],atom[1],atom[2],atom[3],atom[4],atom[5],atom[6],atom[7],atom[8],atom[9],atom[10],atom[11]))
new_pdb.close()
