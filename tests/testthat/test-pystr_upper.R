library(pystr)
context("pystr_upper")

test_that("it converts to lowercase", {
  expect_equal(pystr_upper("hello!"), "HELLO!")
})
