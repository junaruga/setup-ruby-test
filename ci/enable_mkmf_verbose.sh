#!/bin/sh -eu

set -x

gem_home="$(gem environment home)"
mkmf_path="$(find "${gem_home}"/../.. -name mkmf.rb)"

cp -p "${mkmf_path}" "${mkmf_path}.orig"

sed -i -e 's/^V = .*/V = 1/' "${mkmf_path}"

if diff "${mkmf_path}.orig" "${mkmf_path}"; then
	echo "error: ${mkmf_path} was not modified." 1>&2
	exit 1
fi
