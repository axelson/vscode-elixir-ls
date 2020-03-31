#!/bin/bash

echo "Current extensions"
#code --uninstall-extension JakeBecker.elixir-ls
VERSION=$(node -e "console.log(require('./package.json').version);")
echo "VERSion $VERSION"
code --install-extension ./elixir-ls-$VERSION.vsix
