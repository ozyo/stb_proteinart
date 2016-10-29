.. _PVSD

Project Virtual Site
********************

These scripts are meant for creating virtual sites via pdb2gmx. STaGE creates topologies, however if you want to take advantage of fast sampling, you need hdyrogens to be set as virtual sites. There is likely to be errors induced by having virtual sites, but one is sometimes only interested in sampling the phase space. Assuming the errors introduced by virtual sites are within the errors, things should be fine. We are using it for the protein, why wouldn't we use it for the ligands too? 

No estimation of binding energies perhaps, but when you look at conformational changes no need for that high accuracy. 

These scripts are quite preliminary. 