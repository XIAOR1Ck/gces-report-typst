## gces-report-typst

This is a typst template to write project reports and proposals for students of Gandaki College And Engineering And Science

## Installation

First, make sure you have typst installed in your system.
This can be used this in two ways.

- Install As a local package
- Cloning the repo.

_Installation as a package_
To install this as a package follow _local packages_ section of [this guide](https://github.com/typst/packages)
For this project the files will be at `{data-dir}/typst/packages/local/gces-report-typst/0.1.0/`

_Cloning the repo_
For this just clone the repo and edit `main.typ`

## Usage

- If you've cloned the repo the usage is fairly simple. You can just edit `main.typ`. All the required files are imorted and called there.

- If installed as a local package, you can import as `#import "@local/gces-report-typst:0.1.0": *` or `#import "@local/gces-report-typst:0.1.0": generate-report, set-style`
  - _Recommended:_ Copy `main.typ` from the package folder and replace the `import` line with the one above
