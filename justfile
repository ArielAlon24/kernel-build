build target:
    docker build -t {{target}} -f dockerfiles/Dockerfile.{{target}} .

run target:
    docker run --rm -it -v build:/build {{target}}

debug target:
    docker run --rm -it -v build:/build {{target}} /bin/bash

clean:
    rm -rf build
