Toy Robot
=========

[![Build Status](https://circleci.com/gh/lokulin/toy-robot-haskell.svg?style=shield&circle-token=:circle-ci-badge-token)](https://circleci.com/gh/lokulin/toy-robot-java/)

Toy Robot is a rough toy robot implementation in Haskell conforming to the specifications from the [problem description](PROBLEM.md).

Building
--------

Relies on regex-tdfa a native implementation of Posix extended regular expressions.

```
cabal config
cabal clean
cabal build
```

Testing
-------

```
cabal test --show-details=always
```


Running
-------

To run the toy robot against an input file:

```
./dist/build/toyrobot/toyrobot < examples/example1.txt
```

Or interactively:

```
./dist/build/toyrobot/toyrobot
```
