# This file is used to generated the different test book during PRs
repo <- "~/DEV_R/bookdown"

# 404 testing
gert::git_branch_checkout("maelle-404", repo = repo)
devtools::load_all(repo)
render_book(".", "bookdown::bs4_book", quiet = TRUE)
gert::git_add("docs/")
gert::git_commit("Rebuild base book")
gert::git_push()
