library(pystr)
context("pystr_rjust")

test_that("it uses spaces by default", {
  expect_equal(pystr_rjust("hello", 7), "  hello")
})

test_that("it allows you to pass a fillchar", {
  expect_equal(pystr_rjust("hello", 7, "*"), "**hello")
})

test_that("it works with a character vector", {
  expect_equal(pystr_rjust(c("hello", "hi"), 7, "*"), c("**hello", "*****hi"))
})
