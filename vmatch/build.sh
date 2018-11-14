
mkdir -p "$PREFIX"/share/vmatch/
mkdir -p "$PREFIX"/bin

cp -r TRANS "$PREFIX"/share/vmatch/
cp chain2dim cleanpp.sh matchcluster mkdna6idx mkvtree repfind.pl upgradeprj.pl vendian vmatch vmatchselect Vmatchtrans.pl vmigrate.sh vseqinfo vseqselect vstree2tex vsubseqselect "$PREFIX"/bin/

