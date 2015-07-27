defmodule Motiondetection do
	 @on_load :init

	def init() do
		:erlang.load_nif("./priv_dir/lib_elixir_motiondetection", 0)
		:ok
	end

	def test(inputString) do
		_test(String.to_char_list(inputString))
	end

	def _test(inputString) do
		"NIF library not loaded #{inputString}"
	end
end
