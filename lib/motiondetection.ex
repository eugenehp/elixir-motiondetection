defmodule Motiondetection do
	 @on_load :init

	def init() do
		:erlang.load_nif("./priv_dir/lib_elixir_motiondetection", 0)
		:ok
	end

	def test(images_path) do
		{_,filenames} = File.ls images_path
		[filename1 | rest] = filenames
		recursively_list images_path, filename1, rest

		# _test(String.to_char_list(images_path))
	end

	def recursively_list(images_path, filename1, rest) do
		if filename1 != ".DS_Store" do
			compare_two_files images_path, filename1, hd(rest)
		end
		length = length(rest)

		if length > 1 do
			[filename1 | rest] = rest
			recursively_list images_path, filename1, rest
		end
	end

	def compare_two_files(images_path, filename1, filename2) do
		image1 =  File.read "#{images_path}/#{filename1}"
		image2 =  File.read "#{images_path}/#{filename2}"

		IO.puts "Doing compare_two_files with `#{filename1}` and `#{filename2}`"

		case load image1 do
			{:ok,{width,height,out}} -> 	
				IO.puts "So image #{width} and #{height}"
			{:err, message} ->
				IO.puts "Error #{message}"
		end
	end

	# rest of the routine

	def load(_Binary) do
		_load(_Binary)
	end

	def compare(_B1,_B2,_Pos,_MinPos,_Step,_Min) do
		_compare(_B1,_B2,_Pos,_MinPos,_Step,_Min)
	end

	def _test(images_path) do
		"NIF library not loaded. Trying to call method `_load`. And to pass #{images_path}"
	end

	def _load(_Binary) do
		"NIF library not loaded. Trying to call method `_load`."
	end

	def _compare(_B1,_B2,_Pos,_MinPos,_Step,_Min) do
		"NIF library not loaded. Trying to call method `_compare`."
	end
end
