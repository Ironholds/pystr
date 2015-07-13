library(pystr)
context("pystr_isspace")

test_that("it returns true if there's only spaces", {
  expect_true(pystr_isspace("   "))
})

test_that("if returns false if there's something other than a space", {
  expect_false(pystr_isspace("  a  "))
})

test_that("it returns false for an empty string", {
  expect_false(pystr_isspace(""))
})
