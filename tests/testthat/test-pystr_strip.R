library(pystr)
context("pystr_strip")

test_that("it strips out whitespace by default", {
  expect_equal(pystr_strip("   spacious    "), "spacious")
})

test_that("it leaves spaces in the middle alone", {
  expect_equal(pystr_strip("   very spacious   "), "very spacious")
})

test_that("it strips chars from both sides", {
  expect_equal(pystr_strip("www.example.com", "cmowz."), "example")
})

test_that("it returns the same string if there's nothing to strip", {
  expect_equal(pystr_strip("hello world"), "hello world")
})

test_that("it works with a character vector", {
  expect_equal(pystr_strip(c("  spacious  ", "  hi  ")), c("spacious", "hi"))
})
