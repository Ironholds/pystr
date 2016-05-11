library(pystr)
context("pystr_rstrip")

test_that("it strips spaces by default", {
  expect_equal(pystr_rstrip("  spacious  "), "  spacious")
})

test_that("it strips characters until it encounters one that isn't in chars", {
  expect_equal(pystr_rstrip("mississippi", "ipz"), "mississ")
})

test_that("it works with a character vector", {
  expect_equal(pystr_rstrip(c("  spacious  ", "  hi  ")), c("  spacious", "  hi"))
})
