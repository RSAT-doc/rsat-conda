

# TODO: better file system layout and entry point command
RSAT_DEST="$PREFIX/opt/rsat/"
mkdir -p "$RSAT_DEST"

cp -a perl-scripts python-scripts "$RSAT_DEST"


# Build and dispatch compiled binaries
cd contrib
for dbin in *
do
	cd "$dbin"
	make clean && make && cp "$dbin" "$PREFIX/bin"
	cd ..
done


# TODO: R packaging
