[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/BRmhFFxj)
# Repository to hold class activities for GEO511

## Overview
This template repository is set up to hold the semester's case study assignments for GEO511. #A new folder

## Recommendations

### Do
* only commit text files (like `*.R` or `.Rmd` scripts) and possibly very small datasets
* use `.gitignore` to ignore certain files and filetypes

### DON'T
* commit large or non-text files (like `*.ppt`) especially if they will change often (git has 100MB maximum)
* move directories/folders around after starting the course repository
* edit/move the `.git` or `tests` folder
* edit/move the other files (`DESCRIPTION`, etc.)


## Automated Testing
This repository is set up to use automated testing with GitHub actions.  Each time the repository is pushed to GitHub, it will run the tests and report on whether there were any errors.  

To test whether the code passes before you submit to GitHub, run the following lines.  You may need to install the `testthat` package.  

```
library(testthat)
test_dir(test_path(), reporter="Summary")
```

