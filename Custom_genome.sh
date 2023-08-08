#!/bin/bash
#SBATCH --time=7-00:00:00
#SBATCH --mem=250GB
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=50
#SBATCH --account=OD-230743
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=anjana.karawita@csiro.au

WORKDIR=

cd ${WORDIR}

IN_GTF=your_gtf_input
OUT_GTF=filtered_gtf_output
ASEEMBLY=your_assembly
ASSEMBLY_NAME=your_genome_name_to_be

cellranger mkgtf \
  ${IN_GTF} \
  ${OUT_GTF} \
  --attribute=gene_biotype:protein_coding
  --attribute=gene_biotype:lncRNA \
  --attribute=gene_biotype:antisense \
  --attribute=gene_biotype:IG_LV_gene \
  --attribute=gene_biotype:IG_V_gene \
  --attribute=gene_biotype:IG_V_pseudogene \
  --attribute=gene_biotype:IG_D_gene \
  --attribute=gene_biotype:IG_J_gene \
  --attribute=gene_biotype:IG_J_pseudogene \
  --attribute=gene_biotype:IG_C_gene \
  --attribute=gene_biotype:IG_C_pseudogene \
  --attribute=gene_biotype:TR_V_gene \
  --attribute=gene_biotype:TR_V_pseudogene \
  --attribute=gene_biotype:TR_D_gene \
  --attribute=gene_biotype:TR_J_gene \
  --attribute=gene_biotype:TR_J_pseudogene \
  --attribute=gene_biotype:TR_C_gene

cellranger mkref \
  --genome=${ASSEMBLY_NAME} \
  --fasta=${ASSEMBLY} \
  --genes=${OUT_GTF}


  
