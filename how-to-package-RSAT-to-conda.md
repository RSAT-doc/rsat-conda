# How to package RSAT for conda

- Author: **Jacques van Helden**
- Creation date: 2018-12-13
- Last update: 2022-02-24

# Requirements

## Conda packages

**BEWARE:** The standard `conda` installations takes hours to build the dependency tree. 

Thanks to Stéphane Plaisance, who provided us with an alternative (`mamba`) that impressively accelerates the installation. 


```
conda activate # Activate the default conda environment before proceeding to the packaging

mamba install anaconda conda-build anaconda-client
```

## Building conda packages on the local machine

Attention, `conda build` must run in the default conda environment ("base" environment, which is opened with the command   `conda activate` with no argument), and not in a customized environment. Yçou should thus check that your shell prompt starts with `(base) ` before going further.

If you are member of the RSAT development team on github, you can clone the `rsat-conda` repository with the git access.

```
git clone git@github.com:rsa-tools/rsat-conda.git
```

else, you can use the https access

```
git clone https://github.com/rsa-tools/rsat-conda.git
```

Enter the rsat-conda directory. 

```
cd rsat-conda
```


## Building and uploading packages for the dependencies

Before building the rsat-core package, each of its dependencies has to be built and uploaded to anaconda cloud. 


### Command to build a conda package

This is the general command to build a conda package. We ionclude the channels in the command itself.
We will call this command below with different receipes directories, in order to build the packages for RSAT dependencies and, once they are all done, for the RSAT package itself. 

```
conda build  -c conda-forge -c bioconda -c rsat [path_to_the_recipes_dir]
```

### Command to upload a package to anaconda

After having built the package, we will upload it to the anaonda server.

```
anaconda upload -u rsat XXXX (see output of the build)
```

### Perl dependencies

```
PERL_DIRS=`ls -1d perl/*`
echo "Packaging perl dependencies"
echo "${PERL_DIRS}"
for p in ${PERL_DIRS}; do \
  echo "Packaging $p"; \
  conda build  -c conda-forge -c bioconda -c rsat $p >& $p/build_log.txt ; \
done
```

## Updating the RSAT version

- Open a connection to the RSAT distribution site: [http://download.rsat.eu/](http://download.rsat.eu/)

- Note the date of the latest version of the tar archive (e.g. `2022.02.24` for the archive `rsat_2022.02.24.tar.gz`)

- With a text editor, open the file [rsat-core/meta.yaml](rsat-core/meta.yaml) and change the version on the first line.

```
{% set version = "2022.02.24" %}
```

## Building the conda rsat-core package

```

## FASTER ?
mamba  build -c conda-forge -c bioconda -c rsat  rsat-core

## Standard command (takes hours to build the dependency tree)
conda  build -c conda-forge -c bioconda -c rsat  rsat-core
```


**Warning:** this conda packaging apparently requires a quite large RAM. On the IFB core cluster, I allocate 48Gb of ram.

```
srun --mem 48Gb conda install anaconda conda-build anaconda
```

This takes several hours. 

**Beware:** at the end of the compilation, conda displays a message providing an identifier that must be used for the next step. 

## Uploading the package to anaconda

```
anaconda upload -u rsat XXXX ## replace XXXX by the info displayed in the output of the build
```

# Installing RSAT with conda

Create a conda environment for RSAT and declare dependency to 
rsat-core and corresponding channels

```
conda create -n rsat
```


<!-- On IFB core
conda create -p /shared/projects/project_rsat/conda/env/rsat
-->

List existing conda environments

```
conda env list
conda env list | grep rsat
```

Activate conda rsat environment

```
conda activate rsat
```

Install rsat-core in the conda rsat environment


```
conda install -c conda-forge -c bioconda -c rsat  rsat-core
```

Deactivate conda rsat environment

```
conda deactivate rsat
```

# Testing the RSAT commands

```
## Activate the rsat conda environment
conda activate rsat

## Get the list of supported RSAT commands
rsat -h

## Get the help of a given command (e.g. random-seq)
rsat random-seq -h

## Run random-seq to generate 2 sequences of length 100 each
rsat random-seq -n 2 -l 100
```


# Updating the RSAT conda package

```
conda activate rsat
conda update rsat-core
```




