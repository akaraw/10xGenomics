#!/bin/bash
#SBATCH --time=7-00:00:00
#SBATCH --mem=250GB
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=50
#SBATCH --account={your_cod}
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=anjana.karawita@csiro.au

export PATH=/path/to/your/cellranger/bin:$PATH
WORKDIR=define_the_path

cd ${WORKDIR}

#Mock
ID=your_condition #e.g., normal

mkdir -p ${ID}
mytranscriptome=/path/to/genome

fastq_dir=/path/to/your/${ID}_fastqs

cd ${ID}
cellranger count --id=${ID} \
                 --transcriptome=${mytranscriptome} \
                 --fastqs=${fastq_dir}

#Treatment
ID=your_condition #e.g., virus

cd ..
mkdir -p ${ID}

cd ${ID}
mytranscriptome=/path/to/genome
fastq_dir=/path/to/your/${ID}_fastqs

cellranger count --id=${ID} \
                 --transcriptome=${mytranscriptome} \
                 --fastqs=${fastq_dir}

#to aggregate for comparison
#the libraries.csv should look like below
#sample_id,molecule_h5
#normal,/path/to/count/normal/outs/molecule_info.h5
#irradiated,/path/to/count/irradiated/outs/molecule_info.h5

cd ..
cellranger aggr --id=aggr --csv=libraries.csv

#The results will be with in filtered_feature_bc_matrix







