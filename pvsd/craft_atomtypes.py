import os, re

top=open("../ZGLU_gaff/ZGLU.itp","r").readlines()

names_types_charge_number=[]
atom_read=False
for line in top:
    if "atoms" in line:
        atom_read=True
    elif "bonds" in line:
        atom_read=False
    if atom_read is True:
        try:
            mass=line.split()[7].strip()
            atomtypes=line.split()[1].strip()
            atomsec=(atomtypes,mass)
            names_types_charge_number.append(atomsec)
        except IndexError:
            pass

out=open("zglu_atomtypes.dat","w")
for i in list(set(names_types_charge_number)):
    try:
        out.write(str(i[0])+'\t'+str(i[1])+'\n')
    except KeyError:
        pass
out.close()

# print '[ IVM ]'
# print ' [ atoms ]'
# for i in names_types_charge_number:
#     try:
#         print '  '+str(i[0])+'\t'+str(i[1])+'\t'+str(i[2])+'\t'+str(i[3])+'\t'
#     except KeyError:
#         pass

# print ' [ bonds ]'

# for i in bonds:
#     try:
#         print '  '+atomnumbers[i[0]]+'\t'+atomnumbers[i[1]]
#     except KeyError:
#         pass

# print ' [ dihedrals ]'

# for i in dihedral:
#     try:
#         print '  '+atomnumbers[i[0]]+'\t'+atomnumbers[i[1]]+'\t'+atomnumbers[i[3]]+'\t'+atomnumbers[i[3]]
#     except KeyError:
#         pass
