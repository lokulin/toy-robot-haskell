Toy Robot
=========

Toy Robot is a rough toy robot implementation in Haskell conforming to the specifications from the [problem description](PROBLEM.md).

Testing
-------

No tests as of yet.

Building
--------

Relies on regex-tdfa a native implementation of Posix extended regular expressions.

```
cabal install regex-tdfa
ghc -O toyrobot.hs
```

Running
-------

To run the toy robot against an input file:

```
./toyrobot < examples/example1.txt
```

Or interactively:

```
./toyrobot
```
