# This file is used to generated the different test book during PRs
repo <- "~/DEV_R/bookdown"
base_url <- "https://cderv.github.io/bs4booktesting/"

# 404 testing
gert::git_branch_checkout("maelle-404", repo = repo)
devtools::load_all(repo)
render_book(".", "bookdown::bs4_book", quiet = TRUE)
gert::git_add("docs/")
gert::git_commit("Rebuild base book")
gert::git_push()

# x-scroll
out_dir <- "docs/wrap-and-scroll"
gert::git_branch_checkout("maelle-overflow", repo = repo)
devtools::load_all(repo)
render_book(".", "bookdown::bs4_book", output_dir = out_dir, quiet = TRUE)
gert::git_add(out_dir)
gert::git_commit(sprintf("Rebuild book for %s", basename(out_dir)))
gert::git_push()
utils::browseURL(file.path(base_url, basename(out_dir)))
