#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <perl-version>"
    echo "Example: $0 5.14.4"
    exit 1
fi

PERL_VERSION="$1"

# Setup plenv
git clone https://github.com/tokuhirom/plenv.git /root/.plenv
git clone https://github.com/tokuhirom/Perl-Build.git /root/.plenv/plugins/perl-build

# Add plenv to bashrc for future shells
echo 'export PATH="/root/.plenv/bin:$PATH"' >> /root/.bashrc
echo 'eval "$(plenv init -)"' >> /root/.bashrc

# Install the requested Perl version and set global
/bin/bash -lc "plenv install ${PERL_VERSION} && plenv global ${PERL_VERSION}"
