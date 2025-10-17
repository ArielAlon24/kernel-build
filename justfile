build target:
    docker build -t {{target}} -f dockerfiles/Dockerfile.{{target}} .

run target:
    docker run --rm -it -v build:/build {{target}}

clean:
    rm -rf build
