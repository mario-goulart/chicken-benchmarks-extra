## chicken-benchmarks-extra

This is a set of benchmark programs that (hopefully) are closer to
practical uses of CHICKEN in the real world.  It is supposed to be
used together with
[chicken-benchmarks](https://github.com/mario-goulart/chicken-benchmarks).
It is not part of chicken-benchmarks because it requires a lot of
CHICKEN eggs and contains huge data files.


### Requirements

* CHICKEN 5 (benchmark programs won't work with CHICKEN 4)
* Some eggs (see `REQUIRED-EGGS.TXT`)
* Some tools (see `REQUIRED-TOOLS.TXT`)
* [chicken-benchmarks](https://github.com/mario-goulart/chicken-benchmarks)


### Usage

1. Install eggs

```
$ chicken-install $cat REQUIRED-EGGS.TXT)
```

Note that versions of eggs are pinned, as those are the versions known
to work.  You can try to use the most recent version of eggs (or the
versions you have already installed) at your on risk.  To install the
most recent versions of the required eggs, you can run:

```
chicken-install $(cat REQUIRED-EGGS.TXT | cut -d: -f1)
```

2. Install the required tools

See `REQUIRED-TOOLS.TXT`.


3. Get a copy of [chicken-benchmarks](https://github.com/mario-goulart/chicken-benchmarks)

```
$ git clone https://github.com/mario-goulart/chicken-benchmarks
```

4. Populate the filesystem cache with the files used by benchmark programs

```
$ cp -r path/to/chicken-bechmarks-extra/data /dev/null
```

5. Run benchmarks

```
$ cd path/to/chicken-benchmarks
$ ./run.scm --programs-dir=path/to/chicken-benchmarks-extra
```


### Assorted notes

* Some benchmark programs fork external programs.  For those all
  values except build time and CPU time are zero.

* Some benchmark programs might open network ports (e.g., `awful`).
  By default port `8080` will be used.  If that port is already used
  on your system, you can configure an alternative port by setting the
  `CHICKEN_BENCHMARKS_PORT` environment variable with the port number
  that is to be used by benchmark programs.

* See the notes on stability of results in the README file of
  [chicken-benchmarks](https://github.com/mario-goulart/chicken-benchmarks)
