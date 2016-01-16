library(pystr)
context("pystr_isalnum")

test_that("it returns true if all characters are alphabetic or numeric", {
  expect_true(pystr_isalnum("abc123"))
})

test_that("it returns false if not all characters are alphabetic or numeric", {
  expect_false(pystr_isalnum("abc123!"))
})

test_that("it works with a vector of strings", {
  expect_equal(pystr_isalnum(c("one", "2", "three!")), c(TRUE, TRUE, FALSE))
})

test_that("it works with NAs", {
  expect_equal(pystr_isalnum(c("one", "2", NA)), c(TRUE, TRUE, NA))
})
