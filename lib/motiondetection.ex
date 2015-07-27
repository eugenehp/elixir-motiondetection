defmodule Motiondetection do
	 @on_load :init

	def init() do
		:erlang.load_nif("./priv_dir/lib_elixir_motiondetection", 0)
		:ok
	end

	def test(inputString) do
		_test(String.to_char_list(inputString))
	end

	def load(_Binary) do
		_load(_Binary)
	end

	def compare(_B1,_B2,_Pos,_MinPos,_Step,_Min) do
		_compare(_B1,_B2,_Pos,_MinPos,_Step,_Min)
	end

	def _test(inputString) do
		"NIF library not loaded. Trying to call method `_load`. And to pass #{inputString}"
	end

	def _load(_Binary) do
		"NIF library not loaded. Trying to call method `_load`."
	end

	def _compare(_B1,_B2,_Pos,_MinPos,_Step,_Min) do
		"NIF library not loaded. Trying to call method `_compare`."
	end
end
