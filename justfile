build target:
    docker build -t {{target}} -f dockerfiles/Dockerfile.{{target}} .

run target: out_dir
    docker run --rm -it -v $(pwd)/out:/out {{target}}

debug target:
    docker run --rm -it -v $(pwd)/out:/out {{target}} /bin/bash

clean:
    rm -rf out

out_dir:
    rm -rf out
    mkdir -p out
