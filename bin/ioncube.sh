#!/usr/bin/env bash
# Build Path: /app/.heroku/php/

OUT_PREFIX=$1

# fail hard
set -o pipefail
# fail harder
set -eux

DEFAULT_VERSION="LATEST"
dep_version=${VERSION:-$DEFAULT_VERSION}
dep_url=http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
dep_dirname=ioncube

echo "---lalith ioncube installing--> Packaging ext/ioncube ${DEFAULT_VERSION}..."

curl -L ${dep_url} | tar xz

pushd ${dep_dirname}
ext_dir=/app/.heroku/php/lib/php/extensions/no-debug-non-zts-20131226
echo ext_dir
bin_dir=${OUT_PREFIX}/bin
mkdir -p ${ext_dir}
mkdir -p ${bin_dir}
cp ioncube_loader_lin_5.6.so ${ext_dir}/ioncube_loader_lin_5.6.so
popd

echo "-----> Done."