library(pystr)
context("pystr_startswith")

test_that("it works with a string prefix that's present", {
  expect_true(pystr_startswith("www.example.com", "www."))
})

test_that("it works with a string prefix that's not present", {
  expect_false(pystr_startswith("http://example.com", "https://"))
})

test_that("it works with a start and end range", {
  expect_true(pystr_startswith("hello world", "wor", 7))
})

test_that("it returns FALSE when start and end are out of bounds", {
  expect_false(pystr_startswith("hi", "hi", 10, 15))
})

test_that("all strings start with an empty string", {
  expect_true(pystr_startswith("hello", ""))
})

test_that("it works with a character vector", {
  expect_equal(pystr_startswith(c("http://", "https://"), "http://"), c(TRUE, FALSE))
})

test_that("it works with multiple character vectors", {
  expect_equal(pystr_startswith(c("http://", "https://"), c("http://", "https://")), c(TRUE, TRUE))
})

test_that("it recycles arguments", {
 input = c("soccer.jpg", "tennis.jpg", "soccer.png", "tennis.png")
 output = rep(TRUE, 4)

 expect_equal(pystr_startswith(input, c("soccer", "tennis")), output)
})

test_that("it works with an unicode string suffix that's present", {
  str <- "abçläss"
  prefix <- "ab"
  expect_true(pystr_startswith(str, prefix))
})

test_that("it works with a unicode suffix", {
  str <- "baçäök"
  prefix <- "baçäö"
  expect_true(pystr_startswith(str, prefix))
})
