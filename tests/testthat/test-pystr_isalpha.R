library(pystr)
context("pystr_isalpha")

test_that("it returns true when all characters are alphabetic", {
  expect_true(pystr_isalpha("abc"))
})

test_that("it returns false when not all characters are alphabetic", {
  expect_false(pystr_isalpha("abc!"))
})

test_that("it works with a vector of strings", {
  expect_equal(pystr_isalpha(c("one", "2", "three!")), c(TRUE, FALSE, FALSE))
})

test_that("it works with NAs", {
  expect_equal(pystr_isalpha(c("one", "2", NA)), c(TRUE, FALSE, NA))
})
