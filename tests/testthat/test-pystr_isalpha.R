library(pystr)
context("pystr_isalpha")

test_that("it returns true when all characters are alphabetic", {
  expect_true(pystr_isalpha("abc"))
})

test_that("it returns false when not all characters are alphabetic", {
  expect_false(pystr_isalpha("abc!"))
})
