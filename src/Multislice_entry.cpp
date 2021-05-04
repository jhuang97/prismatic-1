// Copyright Alan (AJ) Pryor, Jr. 2017
// Transcribed from MATLAB code by Colin Ophus
// Prismatic is distributed under the GNU General Public License (GPL)
// If you use Prismatic, we kindly ask that you cite the following papers:

// 1. Ophus, C.: A fast image simulation algorithm for scanning
//    transmission electron microscopy. Advanced Structural and
//    Chemical Imaging 3(1), 13 (2017)

// 2. Pryor, Jr., A., Ophus, C., and Miao, J.: A Streaming Multi-GPU
//    Implementation of Image Simulation Algorithms for Scanning
//	  Transmission Electron Microscopy. arXiv:1706.08563 (2017)

#include "meta.h"
#include "params.h"
#include "ArrayND.h"
#include "configure.h"
#include "Multislice_calcOutput.h"
#include "PRISM01_calcPotential.h"
#include "PRISM02_calcSMatrix.h"
#include <algorithm>
#include "utility.h"
#include "fileIO.h"
#include "Multislice_entry.h"
#include "aberration.h"

#ifdef PRISMATIC_ENABLE_GUI
#include <QMutex>
#include <QMutexLocker>
#endif

namespace Prismatic
{
	
Parameters<PRISMATIC_FLOAT_PRECISION> Multislice_entry(Metadata<PRISMATIC_FLOAT_PRECISION> &meta)
{
	Parameters<PRISMATIC_FLOAT_PRECISION> prismatic_pars;
	try
	{ // read atomic coordinates
		prismatic_pars = Parameters<PRISMATIC_FLOAT_PRECISION>(meta);
	}
	catch (...)
	{
		std::cout << "Terminating" << std::endl;
		exit(1);
	}

	prismatic_pars.outputFile = H5::H5File(prismatic_pars.meta.filenameOutput.c_str(), H5F_ACC_TRUNC);

	setupOutputFile(prismatic_pars);
	prismatic_pars.outputFile.close();
	
	prismatic_pars.meta.importSMatrix = false; //incase it is accidentally set
	if(prismatic_pars.meta.importPotential) configureImportFP(prismatic_pars);

	// calculate frozen phonon configurations
	if(prismatic_pars.meta.simSeries)
	{
		for(auto i = 0; i < prismatic_pars.meta.numFP; i++)
		{
			Multislice_series_runFP(prismatic_pars, i);
		}

		for(auto i = 0; i < prismatic_pars.meta.seriesTags.size(); i++)
		{
			std::string currentName = prismatic_pars.meta.seriesTags[i];
			prismatic_pars.currentTag = currentName;
			prismatic_pars.meta.probeDefocus = prismatic_pars.meta.seriesVals[0][i]; //TODO: later, if expanding sim series past defocus, need to pull current val more generally
			
			readRealDataSet_inOrder(prismatic_pars.net_output, "prismatic_scratch.h5", "scratch/"+currentName);
			if(prismatic_pars.meta.saveDPC_CoM)
				readRealDataSet_inOrder(prismatic_pars.net_DPC_CoM, "prismatic_scratch.h5", "scratch/"+currentName+"_DPC");
			//average data by fp
			for (auto &i : prismatic_pars.net_output)
				i /= prismatic_pars.meta.numFP;

			if (prismatic_pars.meta.saveDPC_CoM)
			{
				for (auto &j : prismatic_pars.net_DPC_CoM)
					j /= prismatic_pars.meta.numFP; //since squared intensities are used to calculate DPC_CoM, this is incoherent averaging
			}

			saveSTEM(prismatic_pars);
		}

	}
	else
	{
		prismatic_pars.meta.aberrations = updateAberrations(prismatic_pars.meta.aberrations, prismatic_pars.meta.probeDefocus, prismatic_pars.meta.C3, prismatic_pars.meta.C5, prismatic_pars.lambda);
		for(auto i = 0; i < prismatic_pars.meta.numFP; i++)
		{
			Multislice_runFP(prismatic_pars, i);
		}	

		//average data by fp
		for (auto &i : prismatic_pars.net_output)
			i /= prismatic_pars.meta.numFP;

		if (prismatic_pars.meta.saveDPC_CoM)
		{
			for (auto &j : prismatic_pars.net_DPC_CoM)
				j /= prismatic_pars.meta.numFP; //since squared intensities are used to calculate DPC_CoM, this is incoherent averaging
		}

		saveSTEM(prismatic_pars);
	}
		
	prismatic_pars.outputFile = H5::H5File(prismatic_pars.meta.filenameOutput.c_str(), H5F_ACC_RDWR);
	
	//perhaps have this check against the keys
	if(prismatic_pars.meta.simSeries) CCseriesSG(prismatic_pars.outputFile);

	writeMetadata(prismatic_pars);
	prismatic_pars.outputFile.close();
	if (prismatic_pars.meta.simSeries) removeScratchFile(prismatic_pars);

#ifdef PRISMATIC_ENABLE_GPU
	cout << "peak GPU memory usage = " << prismatic_pars.maxGPUMem << '\n';
#endif //PRISMATIC_ENABLE_GPU
	std::cout << "Calculation complete.\n"
			  << std::endl;
	return prismatic_pars;
}

void Multislice_runFP(Parameters<PRISMATIC_FLOAT_PRECISION> &pars, size_t fpNum)
{

	pars.meta.randomSeed = rand() % 100000;
	pars.meta.fpNum = fpNum;
	cout << "Frozen Phonon #" << fpNum << endl;
	pars.meta.toString();

	pars.outputFile = H5::H5File(pars.meta.filenameOutput.c_str(), H5F_ACC_RDWR);
	pars.fpFlag = fpNum;
	pars.scale = 1.0;

	// compute projected potentials
#ifdef PRISMATIC_BUILDING_GUI
    if(!pars.parent_thread->parent->potentialIsReady() || !(pars.meta == *(pars.parent_thread->parent->getMetadata()))){
        pars.parent_thread->parent->resetCalculation();

#endif
	if(pars.meta.importPotential)
	{
		std::cout << "Using precalculated potential from " << pars.meta.importFile << std::endl;
		PRISM01_importPotential(pars);
	}
	else
	{
		PRISM01_calcPotential(pars);
	}
#ifdef PRISMATIC_BUILDING_GUI
    std::cout << "Potential Calculated" << std::endl;
        {
            QMutexLocker gatekeeper(&pars.parent_thread->dataLock);
            pars.parent_thread->parent->pars = pars;
        }

    }
    else{
        QMutexLocker gatekeeper(&pars.parent_thread->parent->dataLock);
        PRISMThread tmp_parent = &pars.parent_thread;
        pars = pars.parent_thread->parent->pars;
        pars.progressbar = progressbar;
        pars.parent_thread = tmp_parent;
        std::cout << "Potential already calculated. Using existing result." << std::endl;
    }
    pars.parent_thread->parent->potentialRecevied(pars.pot);
    emit pars.parent_thread::potentialCalculated();
#endif

	//update original object as prismatic_pars is recreated later
	Multislice_calcOutput(pars);
	pars.outputFile.close();

	if(fpNum >= 1)
	{
		pars.net_output += pars.output;
		if (pars.meta.saveDPC_CoM) pars.net_DPC_CoM += pars.DPC_CoM;
	}
	else
	{
		pars.net_output = pars.output;
		if (pars.meta.saveDPC_CoM) pars.net_DPC_CoM = pars.DPC_CoM;
	}
	

};

void Multislice_series_runFP(Parameters<PRISMATIC_FLOAT_PRECISION> &pars, size_t fpNum)
{

	pars.meta.randomSeed = rand() % 100000;
	pars.meta.fpNum = fpNum;
	cout << "Frozen Phonon #" << fpNum << endl;
	pars.meta.toString();

	pars.outputFile = H5::H5File(pars.meta.filenameOutput.c_str(), H5F_ACC_RDWR);
	pars.fpFlag = fpNum;
	pars.scale = 1.0;

	// compute projected potentials
#ifdef PRISMATIC_BUILDING_GUI
    if(!pars.parent_thread->parent->potentialIsReady() || !(pars.meta == *(pars.parent_thread->parent->getMetadata()))){
        pars.parent_thread->parent->resetCalculation();

#endif
	if(pars.meta.importPotential)
	{
		std::cout << "Using precalculated potential from " << pars.meta.importFile << std::endl;
		PRISM01_importPotential(pars);
	}
	else
	{
		PRISM01_calcPotential(pars);
	}
#ifdef PRISMATIC_BUILDING_GUI
    std::cout << "Potential Calculated" << std::endl;
        {
            QMutexLocker gatekeeper(&pars.parent_thread->dataLock);
            pars.parent_thread->parent->pars = pars;
        }

    }
    else{
        QMutexLocker gatekeeper(&pars.parent_thread->parent->dataLock);
        PRISMThread tmp_parent = &pars.parent_thread;
        pars = pars.parent_thread->parent->pars;
        pars.progressbar = progressbar;
        pars.parent_thread = tmp_parent;
        std::cout << "Potential already calculated. Using existing result." << std::endl;
    }
    pars.parent_thread->parent->potentialRecevied(pars.pot);
    emit pars.parent_thread::potentialCalculated();
#endif

	for(auto i = 0; i < pars.meta.seriesVals[0].size(); i++)
	{
		std::cout << "------------------- Series iter " << i << " -------------------" << std::endl;

		updateSeriesParams(pars, i);
		std::cout << "current defocus: " << pars.meta.probeDefocus << std::endl;
		pars.meta.aberrations = updateAberrations(pars.meta.aberrations, pars.meta.probeDefocus, pars.meta.C3, pars.meta.C5, pars.lambda);
		Multislice_calcOutput(pars);

		if(i == 0 and fpNum == 0) 
		{
			std::cout << "Creating scratch file" << std::endl;
			createScratchFile(pars);

		}
		updateScratchData(pars);
	}
	pars.outputFile.close();

	

};

} // namespace Prismatic