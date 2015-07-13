library(pystr)
context("pystr_index")

test_that("it gives the index if sub exists", {
  expect_equal(pystr_index("abcd", "ab"), 1)
})

test_that("it throws an error if sub does not exist", {
  expect_error(pystr_index("abcd", "xy"))
})
