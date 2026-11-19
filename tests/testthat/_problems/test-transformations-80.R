# Extracted from test-transformations.R:80

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "nctools", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
paths = vapply(1:2, function(i) tempfile(fileext = ".nc"), "")
on.exit(unlink(c(paths, paste0(paths, ".temp"))))
create_transform_fixture(paths[1])
nc_unlim(paths[1], "time", output = paths[2])
