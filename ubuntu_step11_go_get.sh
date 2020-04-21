#!/bin/bash

nodeModules=(
####################################################################################################
# name                                                     desc
####################################################################################################
  rsc.io/2fa                                             # 2fa is a two-factor authentication agent
  github.com/mfridman/tparse                             # parses go test output
  github.com/maruel/panicparse/cmd/pp                    # parses panic stack traces
  github.com/itchyny/bed/cmd/bed                         # binary editor
  github.com/jingweno/ccat                               # colorizing cat
  github.com/wagoodman/dive                              # exploring each layer in a docker image
)

for k in ${nodeModules[@]}; do go get -v $k; done
