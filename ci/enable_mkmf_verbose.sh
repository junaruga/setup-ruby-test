#!/bin/sh -eu

set -x

gem_home="$(gem environment home)"
mkmf_path="$(find "${gem_home}"/../.. -name mkmf.rb)"

cp -p "${mkmf_path}" "${mkmf_path}.orig"

sed -i -e 's/^V = .*/V = 1/' "${mkmf_path}"
grep '^V = 1' "${mkmf_path}"

diff "${mkmf_path}.orig" "${mkmf_path}" || :
