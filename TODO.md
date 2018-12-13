---
title: "RSAT bioconda packaging tasks"
author: "Jacques van Helden"
date: "11/13/2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# To do

## Other dependencies

- mkvtree and vmatch for purge-sequences
- Ensembl API
- BLAST for genome-blast

## Python scripts

- importer modules (scipy, nympy, ...)
- remplacer opt-parse par argsparse
- setup.py pour les outils python
- remplacer les `print machin` par `print(machin)` pour assurer compatibilité python3
- check if go tools are still used anywhere (proabaly not) and suppress them



## Perl scripts

- Bio::Das
- Ensembl modules
- mettre les scripts perl au bon endroit
- remplacer 


## R

- dépendance fortran
- compiler TFBMclust
- installer les dépendances R via conda


# Done

## Perl

- replaced `/usr/bin/perl` by `/usr/bin/env perl`
- replaced `/usr/bin/env perl -w` by `/usr/bin/env perl`


****************************************************************
# Not done

- packaging of XML modules
- packaging of Email modules

