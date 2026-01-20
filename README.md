## gces-report-typst

This is a typst template to write project reports and proposals for students of Gandaki College And Engineering And Science

## Features

- follows GCES project Specifications
- Generates Front page, Cover page and Approval Certificate Dynamically
- Hierarchical Figure naming
- Easy to use

## Installation

First, make sure you have typst installed in your system.
This can be used this in two ways.

- Install As a local package
- Cloning the repo.

1. **_Installation as a package_**
   To install this as a package follow _local packages_ section of [this guide](https://github.com/typst/packages)

For this project the files will be at `{data-dir}/typst/packages/local/gces-report-typst/0.1.0/`

2. **_Cloning the repo_**
   For this just clone the repo and edit `main.typ`

## Usage

- If you've cloned the repo the usage is fairly simple. You can just edit `main.typ`. All the required files are imported and called there.

- If installed as a local package, you can import in any file as `#import "@local/gces-report-typst:0.1.0": *` or `#import "@local/gces-report-typst:0.1.0": generate-report, set-style`
- Or for importing the whole folder structure after installing as local package

```sh
$ typst init @local/gces-report-typst:0.1.0 my-report
$ cd my-report
$ typst watch main.typ
```

## Methods

There are mainly 2 methods defined in the package.

(_Note_: There are other methods in other files but since the package uses `lib.typ` file only while importing, all other things are handled in `lib.typ`)

### set-style

This is used to set universal formatting specifications to the document. The formatting rules are defined in `style.typ` and this is a wrapper for that.

- **_Usage:_** `#show: doc => set-style(doc)`

### generate-report

This method is used to generate front matter components. It handles all the components upto the table of contents of the document(Until before the chapters)<br>
`generate-report` has method `info` which takes different parameters to set the document.

- `document-type` : This is used to set they type of the document like _Proposal_ or _Report_.
  - **_Usage:_** `document-type: "Report"`
- `project-type` : This is used to set the project type such as _Major_ or _Minor_.
  - **_Uasge:_** `peoject-type: "Major"`
- `title` : Used to pass the title of the document.
  - **_Usage:_** `title: "Your Project title"`
- `students` : Pass the name of students involved in the project._type:_ `array`. Make sure you pass them in alphabetical order.
  - **_Usage:_** `students: ("Student 1", "Student 2", "Student 3")`
- `logo` : Pass the college logo. You don't have to pass this as it's automatically set. but if you want to override the default logo then.
  - **_Usage:_** `logo: image("path-to-image")`
- `date` : Pass the date of submission. This is important for coverpages and Approval certificate.
  - **_Usage:_** `date: datetime(month: 1, day: 20, year: 2020)`
- `project-head` : Name of head of Department Of Research. Currently _Er. Santosh Panth_. This is used in Approval Certificate.
  - **_Usage:_** `project-head: "Er. Santosh Panth"`
- `supervisor` : name of your project supervisor.
  - **_Usage:_** `supervisor: "Supervisor Name"`
- `front-matter` : This is a very important parameter. This is used to pass other components of the front matter like Abstract, Acknowledgement, etc. These are written in a seperate file of their own and passed as an array. Let's say you have two files `abstract.typ` and `ack.typ` for front matter.
  - **_Usage:_** `front-matter: ("Abstract.typ", "ack.typ")`
  - `bib` : Pass a bibliography object to set up bibliography page and reference.
    - **_Usage:_** First you'll have to create a bibliography object with `#let refs = bibliography("path-to-file.bib")`
    - Then pass the object. `bib: refs`
    - Then references in the `.bib` file can be called by `@tag`

  **_Calling the function will look like:_**

  ```typst
  #show: generate-report.with(
  info: (
  title: "BitMaatDaan",
  students: ("Anim Malla", "Saksham Shrestha", "Suresh Acharya"),
  logo: image("gces-logo.png", width: 30%),
  date: datetime.today(),
  project-head: "Santosh Panth",
  supervisor: "Ranjan Adhikari",
  front-matter: ("Abstract.typ", "ack.typ"),
  document-type: "Report",
  project-type: "Major",
  bibs: refs
  ))
  ```
