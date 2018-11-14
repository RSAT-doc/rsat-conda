
# TODO: detect proper target folder
TARGET="$PREFIX"/lib/site_perl/5.26.2/

mkdir -p "$TARGET"
cp -r modules/Bio/ "$TARGET"

