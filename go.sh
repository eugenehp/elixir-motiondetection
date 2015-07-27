#!/bin/sh

clean
echo "==============================="
echo "compiling the NIF module first"
echo "===============================\n\n"
make
echo "==============================="
echo "Compiling Erlang application"
echo "===============================\n\n"
mix clean
mix compile
echo "==============================="
echo "Running Erlang application"
echo "===============================\n\n"
iex -S mix
