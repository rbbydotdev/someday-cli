#!/usr/bin/env bash

set -o errexit

executedFile="${BASH_SOURCE[0]}"
parentDirectory=$(cd "$(dirname "${executedFile}")" && pwd)
rootDirectory=$(cd "$(dirname "${parentDirectory}")" && pwd)

mkdir -p "${rootDirectory}/dist/google_apps_script"
rm -rf "${rootDirectory}/dist/google_apps_script/"*

echo "Building backend..."
pushd "${rootDirectory}/sources/backend"
npm run build
popd
cp "${rootDirectory}/sources/backend/dist/"* "${rootDirectory}/dist/google_apps_script/"
echo "Backend built successfully!"

echo ""

echo "Building frontend..."
pushd "${rootDirectory}/sources/frontend"
npm run build
popd
cp "${rootDirectory}/sources/frontend/dist/"* "${rootDirectory}/dist/google_apps_script/"
echo "Frontend built successfully!"

cp "${rootDirectory}/sources/appsscript.json" "${rootDirectory}/dist/google_apps_script"

echo ""

echo "Building CLI..."
# TODO: Will build CLI here once build process setup
echo "CLI built successfully!"

echo ""

echo "Build complete!"
