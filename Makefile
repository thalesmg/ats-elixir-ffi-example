bin_elixir ?= elixir
ERL_FLAGS := -I$(shell $(bin_elixir) -e '[:code.root_dir(), ["erts-", :erlang.system_info(:version)], "include"] |> Path.join() |> IO.puts()')

NIF_FILE := priv/nif/bah.so

.PHONY: test clean

compile: $(NIF_FILE)

test: $(NIF_FILE)
	mix test

$(NIF_FILE): src-ats/DATS/bah.dats
	mkdir -p priv/nif/
	patscc $(ERL_FLAGS) -fpic -shared $(<) -o $(@)

clean:
	rm -f $(NIF_FILE)
	rm -f bah_dats.c
