library(pystr)
context("pystr_lower")

test_that("it converts to lowercase", {
  expect_equal(pystr_lower("HELLO!"), "hello!")
})

test_that("it works with a character vector", {
  expect_equal(pystr_lower(c("HELLO!", "hellO")), c("hello!", "hello"))
})
