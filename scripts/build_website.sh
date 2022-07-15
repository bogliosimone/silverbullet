#!/bin/sh

npm run clean-build
rm -rf website
mkdir -p website/fs/_plug
cp -r packages/web/dist/* website/
cp _redirects website/
cp -r docs/* website/fs/
cp packages/plugs/dist/* website/fs/_plug/
find website/fs/ -depth -name "*.md" -exec sh -c 'mv "$1" "${1%.md}"' _ {} \;
find website/fs/ -depth -name "*.plug.json" -exec sh -c 'mv "$1" "${1%.plug.json}"' _ {} \;
node scripts/generate_fs_list.js > website/index.json