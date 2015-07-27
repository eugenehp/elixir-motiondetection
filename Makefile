ERLANG_PATH = $(shell erl -eval 'io:format("~s", [lists:concat([code:root_dir(), "/erts-", erlang:system_info(version), "/include"])])' -s init stop -noshell)
CFLAGS = -g -O3 -ansi -pedantic -Wall -Wextra -Wno-declaration-after-statement -Wno-missing-field-initializers -I$(ERLANG_PATH)

# -Wno-declaration-after-statement 
# -Wno-missing-field-initializers
# keep an eye on the static linkage to jpeg lib `-ljpeg`

ifneq ($(OS),Windows_NT)
	CFLAGS += -fPIC

	ifeq ($(shell uname),Darwin)
		LDFLAGS += -dynamiclib -undefined dynamic_lookup -ljpeg
	endif
endif

priv_dir/lib_elixir_motiondetection.so: clean
	$(CC) $(CFLAGS) -shared $(LDFLAGS) -o $@ c_src/lib_elixir_motiondetection.c

clean:
	$(RM) -r priv_dir/*

