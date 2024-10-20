build:
    mkdir -p build && odin build src -out:./build/main


run width="800" height="600": build
	./run_kitty.sh {{width}} {{height}} 0 1 yes ./build/main
