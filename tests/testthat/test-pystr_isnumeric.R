library(pystr)
context("pystr_isnumeric")

test_that("it returns true when all characters are numeric", {
  expect_true(pystr_isnumeric("123"))
})

test_that("it returns false when not all characters are numeric", {
  expect_false(pystr_isnumeric("12a3"))
})
