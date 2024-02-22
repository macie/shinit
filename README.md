# shinit

[![Quality check status](https://github.com/macie/shinit/actions/workflows/check.yml/badge.svg)](https://github.com/macie/shinit/actions/workflows/check.yml)
[![License](https://img.shields.io/github/license/macie/smallstache.sh)](https://tldrlegal.com/license/mit-license)

**shinit** interactively initializes empty project for a Bourne shell script.

`shinit` asks user for:
- project name (by default: `sh-<hash>`),
- author name (by default: user from git config or current OS user),
- license ID from corporate-safe selection:
    - [MIT](https://choosealicense.com/licenses/mit/) (default) - to maximize
        chance of mass adoption by preserving authorship information only,
    - [GPL-3.0-only](https://choosealicense.com/licenses/gpl-3.0/) - to secure
        access to the source code at the cost of adoption across for-profit
        organizations,
    - [MIT-0](https://choosealicense.com/licenses/mit-0/) - to release the
        source code into the public domain, even in jurisdictions without
        the public domain.

Based on answers, `shinit` creates a new directory with:

- initialized Git repository and `.gitignore` allow list
- shell script with executable permissions
- `Makefile` with configured development targets
- `LICENSE` file
- `README.md` with basic info.

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
