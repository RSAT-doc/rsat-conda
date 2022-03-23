# RSAT conda packaging

Code to generate a conda package for the Regulatory Sequence Analysis Tools (RSAT; <http://rsat.eu/>)

This project started at the ELIXIR Biohackathons 2018 and 2019, and was pursued and finalized with the help of Bjorn Grünig and Anthony Bretedeau. 


# Commands


## Installing rsat-core from the conda package

```{bash}
## Create a conda environment
conda create -n rsat

## Activate the conda environment
conda activate rsat

## Install rsat-core, using mamba (much faster than conda)
## Thanks to Stephane Plaisance for the suggestion
mamba install -c bioconda rsat-core

```
