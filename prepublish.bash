#!/usr/bin/env bash
set -e

RELEASE_DIR=~/dev/forks/vscode-elixir-ls/elixir-ls-release

tsc -p ./
cp elixir-ls/CHANGELOG.md .

cd elixir-ls
#cp .tool-versions
mix deps.get
mix elixir_ls.release -o ../elixir-ls-release

#cd ~/config/repos/elixir-ls
#mix elixir_ls.release -o /home/jason/dev/forks/vscode-elixir-ls/elixir-ls-release

cp ~/dev/ls_proxy/app/app $RELEASE_DIR/ls_proxy
cp $RELEASE_DIR/language_server.sh $RELEASE_DIR/real2_language_server.sh
mv $RELEASE_DIR/language_server.sh $RELEASE_DIR/real_language_server.sh
ln -s $RELEASE_DIR/ls_proxy $RELEASE_DIR/language_server.sh
