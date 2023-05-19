#!/bin/bash

set -eux

id

mkmf_path="$(find "$(gem environment home)"/../.. -name mkmf.rb)"
echo "mkmf_path: ${mkmf_path}"

ls -l "${mkmf_path}"
cp -p "${mkmf_path}" "${mkmf_path}.orig"
sed -i -e 's/^V = .*/V = 1/' "${mkmf_path}"

grep '^V = ' "${mkmf_path}"
diff "${mkmf_path}.orig" "${mkmf_path}" || :
