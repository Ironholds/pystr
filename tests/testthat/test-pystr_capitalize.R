library(pystr)
context("pystr_capitalize")

test_that("it returns itself if it's already capitalized", {
  original = "Hello"
  capitalized = pystr_capitalize(original)
  expect_equal(capitalized, "Hello")
})

test_that("it capitalizes the first letter only", {
  original = "hello"
  capitalized = pystr_capitalize(original)
  expect_equal(capitalized, "Hello")
})

test_that("it decapitalizes letters beyond the first letter", {
  original = "hello WORLD"
  capitalized = pystr_capitalize(original)
  expect_equal(capitalized, "Hello world")
})
