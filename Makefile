compile: bah.so

bah.so: bah.dats
	patscc -I/lib/erlang/erts-11.1.1/include/ -fpic -shared bah.dats -o bah.so
