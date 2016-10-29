import os, re

top=open("../ZGLU_gaff/ZGLU.itp","r").readlines()

bonds=[]
bondRead=False
for line in top:
    if "bonds" in line:
        bondRead=True
    elif "pairs" in line:
        bondRead=False
    if bondRead is True:
        try:
            bond1=line.split()[0].strip()
            bond2=line.split()[1].strip()
            bond12=(bond1,bond2)
            bonds.append(bond12)
        except IndexError:
            pass

dihedral=[]
dihedralRead=False
for line in top:
    if "dihedrals" in line:
        dihedralRead=True
    elif "ifdef" in line:
        dihedralRead=False
    if dihedralRead is True:
        try:
            dh1=line.split()[0].strip()
            dh2=line.split()[1].strip()
            dh3=line.split()[2].strip()
            dh4=line.split()[3].strip()
            dh1234=(dh1,dh2,dh3,dh4)
            dihedral.append(dh1234)
        except IndexError:
            pass


atomnumbers={}
names_types_charge_number=[]
atom_read=False
for line in top:
    if "atoms" in line:
        atom_read=True
    elif "bonds" in line:
        atom_read=False
    if atom_read is True:
        try:
            atnames=line.split()[4].strip()
            numbers=line.split()[0].strip()
            charge=line.split()[6].strip()
            atomtypes=line.split()[1].strip()
            atomnumbers[numbers]=atnames
            atomsec=(atnames,atomtypes,charge,numbers)
            names_types_charge_number.append(atomsec)
        except IndexError:
            pass

out=open("zglu_block.dat","w")
out.write('[ ZGLU ]'+'\n')
out.write(' [ atoms ]'+'\n')
for i in names_types_charge_number:
    try:
        out.write('  '+str(i[0])+'\t'+str(i[1])+'\t'+str(i[2])+'\t'+str(i[3])+'\t'+'\n')
    except KeyError:
        pass
out.write(' [ bonds ]'+'\n')
for i in bonds:
    try:
        out.write('  '+atomnumbers[i[0]]+'\t'+atomnumbers[i[1]]+'\n')
    except KeyError:
        pass
out.write(' [ dihedrals ]'+'\n')
for i in dihedral:
    try:
        out.write('  '+atomnumbers[i[0]]+'\t'+atomnumbers[i[1]]+'\t'+atomnumbers[i[2]]+'\t'+atomnumbers[i[3]]+'\n')
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
