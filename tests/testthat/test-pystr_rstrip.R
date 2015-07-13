library(pystr)
context("pystr_rstrip")

test_that("it strips spaces by default", {
  expect_equal(pystr_rstrip("  spacious  "), "  spacious")
})

test_that("it strips characters until it encounters one that isn't in chars", {
  expect_equal(pystr_rstrip("mississippi", "ipz"), "mississ")
})
