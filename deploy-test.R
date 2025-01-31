# This file is used to generated the different test book during PRs
repo <- "~/DEV_R/bookdown"
base_url <- "https://cderv.github.io/bs4booktesting"

# master branch
gert::git_branch_checkout("master", repo = repo)
devtools::load_all(repo)
render_book(".", "bookdown::bs4_book", quiet = TRUE)

# 404 testing
gert::git_branch_checkout("maelle-404", repo = repo)
devtools::load_all(repo)
render_book(".", "bookdown::bs4_book", quiet = TRUE)
gert::git_add("docs/")
gert::git_commit("deploy base book")
gert::git_push()
utils::browseURL(base_url)

# gitbook
devtools::load_all(repo)
render_book(".", "bookdown::gitbook", quiet = TRUE, output_dir = "docs/gitbook")
gert::git_add("docs/")
gert::git_commit("deploy gitbook version book")
gert::git_push()
utils::browseURL(file.path(base_url, "gitbook/"))
