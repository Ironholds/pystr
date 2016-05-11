library(pystr)
context("pystr_istitle")

test_that("it returns true if the string is titled", {
  expect_true(pystr_istitle("Hello World"))
})

test_that("it returns false if the string is not titled", {
  expect_false(pystr_istitle("hello world"))
})

test_that("it works with a character vector", {
  expect_equal(pystr_istitle(c("Hello World", "hello world")), c(TRUE, FALSE))
})
