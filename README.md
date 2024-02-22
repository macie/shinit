# shinit

[![CI](https://github.com/macie/shinit/actions/workflows/check.yml/badge.svg)](https://github.com/macie/shinit/actions/workflows/check.yml)

**shinit** create empty Bourne shell script in new directory with:

- README.md and LICENSE files
- configured Git repository.

## Usage

To initialize new project inside `~/dev` directory type:
 
```sh
shinit ~/dev
```

## Installation

> For best user experience _shinit_ should be installed inside directory from
> `PATH` environmental variable. 

Using `curl`:

```sh
curl -fLO https://raw.githubusercontent.com/macie/shinit/dev/shinit
chmod +x shinit
```

or with `wget`:

```sh
wget https://raw.githubusercontent.com/macie/shinit/dev/shinit
chmod +x shinit
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

## License

[MIT](./LICENSE) ([explanation in simple words](https://tldrlegal.com/license/mit-license))
