library(pystr)
context("pystr_isnumeric")

test_that("it returns true when all characters are numeric", {
  expect_true(pystr_isnumeric("123"))
})

test_that("it returns false when not all characters are numeric", {
  expect_false(pystr_isnumeric("12a3"))
})

test_that("it works with a vector of strings", {
  nums = c("123", "123a", "123!")
  expect_equal(pystr_isnumeric(nums), c(TRUE, FALSE, FALSE))
})

test_that("it works with NAs", {
  nums = c("123", "123a", NA)
  expect_equal(pystr_isnumeric(nums), c(TRUE, FALSE, NA))
})
