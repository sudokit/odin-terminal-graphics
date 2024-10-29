build:
    mkdir -p build && odin build src -out:./build/main


run: build
	./run_kitty.sh 800 600 0 yes ./build/main
