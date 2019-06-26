# How to package RSAT for conda

- Author: **Jacques van Helden**
- Date: Dec 13, 2018

# Requirements

## Conda packages


```
conda activate # Activate the default conda environment before proceeding to the packaging

conda install anaconda conda-build anaconda-client
```

## Building conda packages on the local machine

Attention, `conda build` must run in the default conda environment ("base" environment, which is opened with the command   `source activate` with no argument), and not in a customized environment.

If you are member of the RSAT development team on github, you can clone the rsat-conda repository with the git access.

```
git clone git@github.com:RSAT-doc/rsat-conda.git
```

else, you can use the https access

```
git clone https://github.com/RSAT-doc/rsat-conda.git
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

- Note the date of the latest version of the tar archive (e.g. `2019.06.24` for the archive `rsat_2019.06.24.tar.gz`)

- With a text editor, open the file [rsat-core/meta.yaml](rsat-core/meta.yaml) and change the version on the first line.

```
{% set version = "2019.06.24" %}
```

## Building and uploading rsat

Build:

```
conda  build -c conda-forge -c bioconda -c rsat  rsat-core
```

Upload :

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

# Updating the RSAT conda package

```
conda activate rsat
conda update rsat-core
```




