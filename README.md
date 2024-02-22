# shinit

[![Quality check status](https://github.com/macie/shinit/actions/workflows/check.yml/badge.svg)](https://github.com/macie/shinit/actions/workflows/check.yml)
[![License](https://img.shields.io/github/license/macie/smallstache.sh)](https://tldrlegal.com/license/mit-license)

**shinit** interactively creates empty Bourne shell script in new directory with:

- `README.md` and `LICENSE` files
- `Makefile` with configured development targets
- configured Git repository.

## Usage

To initialize new project inside `~/dev` directory type:
 
```sh
shinit ~/dev
```

## Installation

>The instruction is for Linux. On different OSes, you may need to use different
>commands

1. Download [latest stable release from GitHub](https://github.com/macie/shinit/releases/latest):

    ```bash
    wget https://github.com/macie/shinit/releases/latest/download/shinit
    ```

2. (OPTIONAL) Verify downloading:

    ```bash
    wget https://github.com/macie/shinit/releases/latest/download/shinit.sha256sum
    sha256sum -c shinit.sha256sum
    ```

3. Set execute permission:

    ```bash
    chmod +x shinit
    ```

4. Move to directory from `PATH` environment variable:

    ```bash
    mv shinit /usr/local/bin/
    ```

### Development version

```bash
git clone git@github.com:macie/shinit.git
cd shinit
make install
```

## Development

Use `make` (GNU or BSD):

- `make` - run checks
- `make test` - run test
- `make check` - perform static code analysis
- `make install` - install in `/usr/local/bin`
- `make dist` - prepare distribution
- `make clean` - remove development artifacts
- `make info` - print system info (useful for debugging).


### Versioning

`shinit` is versioned according to the scheme `YY.0M.MICRO` ([calendar versioning](https://calver.org/)). Releases are tagged in Git.

## License

[MIT](./LICENSE) ([explanation in simple words](https://tldrlegal.com/license/mit-license))
