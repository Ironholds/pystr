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

test_that("it works with vectors of strings", {
  original = c("HELLO", "WORLD")
  capitalized = pystr_capitalize(original)
  expect_equal(capitalized, c("Hello", "World"))
})

test_that("it handles NAs appropriately", {
  original = c("HELLO", NA)
  capitalized = pystr_capitalize(original)
  expect_equal(capitalized, c("Hello", NA))
})
