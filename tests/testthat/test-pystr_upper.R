library(pystr)
context("pystr_upper")

test_that("it converts to lowercase", {
  expect_equal(pystr_upper("hello!"), "HELLO!")
})

test_that("it works with a character vector", {
  expect_equal(pystr_upper(c("Hello", "World")), c("HELLO", "WORLD"))
})
