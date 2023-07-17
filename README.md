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

## License

[MIT](./LICENSE) ([explanation in simple words](https://tldrlegal.com/license/mit-license))
