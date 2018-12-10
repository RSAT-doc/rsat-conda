

# TODO: better file system layout and entry point command
RSAT_DEST="$PREFIX/opt/rsat/"
mkdir -p "$RSAT_DEST"

cp -a perl-scripts python-scripts makefiles "$RSAT_DEST"


# Build and dispatch compiled binaries
cd contrib
for dbin in *
do
    if [ -d "$dbin" ]; then
        cd "$dbin"
        make clean && make CC=$CC CXX=$CXX && cp "$dbin" "$PREFIX/bin"
        cd ..
    fi
done


# TODO: R packaging
