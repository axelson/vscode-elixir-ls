#!/usr/bin/env bash
set -e

RELEASE_DIR=~/dev/forks/vscode-elixir-ls/elixir-ls-release

tsc -p ./
cp elixir-ls/CHANGELOG.md .

# From this repo
#cd elixir-ls
#mix deps.get
#mix elixir_ls.release -o ../elixir-ls-release

# From config dir
#cd ~/config/repos/elixir-ls
#mix elixir_ls.release -o $RELEASE_DIR

# From dev repo
echo "Compiling ElixirLS!"
cd ~/dev/forks/elixir-ls
mix elixir_ls.release -o $RELEASE_DIR
echo "DONE Compiling ElixirLS!"

mv $RELEASE_DIR/language_server.sh $RELEASE_DIR/real_language_server.sh
cp ~/dev/ls_proxy/app/app $RELEASE_DIR/language_server.sh

#cp ~/dev/ls_proxy/app/app $RELEASE_DIR/ls_proxy
#cp $RELEASE_DIR/language_server.sh $RELEASE_DIR/real2_language_server.sh
#mv $RELEASE_DIR/language_server.sh $RELEASE_DIR/real_language_server.sh
#ln -s $RELEASE_DIR/ls_proxy $RELEASE_DIR/language_server.sh
