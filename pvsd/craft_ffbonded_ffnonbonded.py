import os, re

top=open("../ZGLU_gaff/ZGLU.itp","r").readlines()

##Atoms section
atomnumbers={} ##mathecs types
atom_read=False
for line in top:
    if "atoms" in line:
        atom_read=True
    elif "[ " in line:
        atom_read=False
    if atom_read is True:
        try:
            attypes=line.split()[1].strip()
            numbers=line.split()[0].strip()
            atomnumbers[numbers]=attypes
        except IndexError:
            pass

##bonds section
bonds=[]
bondRead=False
for line in top:
    if "bonds" in line:
        bondRead=True
    elif "[ " in line:
        bondRead=False
    if bondRead is True:
        try:
            bondl=line.split()
            bondl[0]=atomnumbers[bondl[0]]
            bondl[1]=atomnumbers[bondl[1]]
            bondn='\t'.join(bondl)
            bonds.append(bondn)
        except IndexError:
            pass
        except KeyError:
            pass

##angles section
angles=[]
angleRead=False
for line in top:
    if "angles" in line:
        angleRead=True
    elif "[ " in line:
        angleRead=False
    if angleRead is True:
        try:
            anglel=line.split()
            anglel[0]=atomnumbers[anglel[0]]
            anglel[1]=atomnumbers[anglel[1]]
            anglel[2]=atomnumbers[anglel[2]]
            anglen='\t'.join(anglel)
            angles.append(anglen)
        except IndexError:
            pass
        except KeyError:
            pass
            

##dihedral section
dihedrals=[]
dihedralRead=False
for line in top:
    if "dihedrals" in line:
        dihedralRead=True
    elif "ifdef" in line:
        dihedralRead=False
    if dihedralRead is True:
        try:
            dihedrall=line.split()
            dihedrall[0]=atomnumbers[dihedrall[0]]
            dihedrall[1]=atomnumbers[dihedrall[1]]
            dihedrall[2]=atomnumbers[dihedrall[2]]
            dihedrall[3]=atomnumbers[dihedrall[3]]
            dihedraln='\t'.join(dihedrall)
            dihedrals.append(dihedraln)
        except IndexError:
            pass
        except KeyError:
            pass

out=open("zglu_ffbonded.itp","w")
out.write('[ bondtypes ]'+'\n')
for i in bonds:
    out.write(i+'\n')
out.write('[ angletypes ]'+'\n')
for i in angles:
    out.write(i+'\n')
out.write('[ dihedraltypes ]'+'\n')
for i in dihedrals:
    out.write(i+'\n')
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
