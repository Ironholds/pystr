library(pystr)
context("pystr_title")

test_that("the first letter is capitalized", {
  expect_equal(pystr_title("hello world"), "Hello World")
})

test_that("letters after non-alphas are capitalized", {
  expect_equal(pystr_title("hello3world"), "Hello3World")
})

test_that("it works with a character vector", {
  expect_equal(pystr_title(c("Hello world", "hi mom")), c("Hello World", "Hi Mom"))
})
