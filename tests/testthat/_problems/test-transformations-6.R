# Extracted from test-transformations.R:6

# setup ------------------------------------------------------------------------
library(testthat)
test_env <- simulate_test_env(package = "nctools", path = "..")
attach(test_env, warn.conflicts = FALSE)

# test -------------------------------------------------------------------------
paths = vapply(1:2, function(i) tempfile(fileext = ".nc"), "")
on.exit(unlink(paths))
create_transform_fixture(paths[1])
field = small_field()
nc_extract(paths[1], "anomaly", paths[2])
