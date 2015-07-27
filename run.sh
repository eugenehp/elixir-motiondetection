#!/bin/sh

echo "==============================="
echo "Compiling Erlang application"
echo "===============================\n\n"
mix clean
mix compile
mix test
echo "==============================="
echo "Running Erlang application"
echo "===============================\n\n"
iex -S mix
