library(pystr)
context("pystr_lower")

test_that("it converts to lowercase", {
  expect_equal(pystr_lower("HELLO!"), "hello!")
})
