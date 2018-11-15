Tiny SED Script to Colorize `go test`
=====================================
[![Linux/macOS Test Status][travisci-badge]][travisci]

This repository provides tiny `sed` script to colorize `go test`.

![sreenshot](https://github.com/rhysd/ss/blob/master/gotest/main.png?raw=true)

## Installation

1. Copy [`gotest`](gotest) script to your `$PATH` directory
2. Give it an executable permission with `chmod +x`

## Usage

```
$ gotest [args...]
```

Arguments are the same as `go test` but `-v` is always implied.

The reason I created this thought [gotest](https://github.com/rakyll/gotest) already exists is that
my requirements can be met with only ~20 lines of shell script. Smaller script is better because
it can be modified/fixed easily and easy to understand and easy to test.

## License

[MIT License](LICENSE.txt)

[travisci-badge]: https://travis-ci.org/rhysd/gotest.svg?branch=master
[travisci]: https://travis-ci.org/rhysd/gotest
