# How to package RSAT for conda

- Author: **Jacques van Helden**
- Date: Dec 13, 2018

# Requirements

## Conda packages


```
conda install anaconda
conda install conda-build
conda install anaconda-client
```

## Building conda packages on the local machine

Attention, `conda build` must run in the default conda environment ("base" environment, which is opened with the command   `source activate` with no argument), and not in a customized environment.

```
git clone https://github.com/RSAT-doc/rsat-conda.git
cd rsat-conda
cd ~/rsat-doc/rsat-conda
source activate
```

## Building and uploading packages for the dependencies

Before building the rsat-core package, each of its dependencies has to be built and uploaded to anaconda cloud. 


### Command to build a conda package

```
conda build  -c conda-forge -c bioconda -c rsat [path_to_the_recipes_dir]
```

### Command to upload a package to anaconda

```
anaconda upload -u rsat XXXX (see output of the build)
```

### Perl dependencies

```
PERL_DIRS=`ls -1d perl/*`
for p in ${PERL_DIRS}; do \
  echo "Packaging $p"; \
  conda build  -c conda-forge -c bioconda -c rsat $p >& $p/build_log.txt ; \
done
```

## Updating the RSAT version

- Open a connection to the RSAT distribution site: [http://download.rsat.eu/](http://download.rsat.eu/)

- Note the date of the latest version of the tar archive (e.g. `2018.12.13` for the archive `rsat_2018.12.13.tar.gz`)

- With a text editor, open the file [rsat-core/meta.yaml](rsat-core/meta.yaml) and change the version on the first line.

```
{% set version = "2018.12.13" %}
```

## Building and uploading rsat

Build:

```
conda  build -c conda-forge -c bioconda -c rsat  rsat-core
```

Upload :

```
anaconda upload -u rsat XXXX (see output of the build)
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
source activate rsat
```

Install rsat-core in the conda rsat environment

```
conda install -c conda-forge -c bioconda -c rsat  rsat-core
```

Deactivate conda rsat environment

```
source deactivate rsat
```

# Updating the RSAT conda package

```
source activate rsat
conda update rsat-core
```

