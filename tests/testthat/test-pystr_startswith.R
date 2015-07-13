library(pystr)
context("pystr_startswith")

test_that("it works with a string prefix that's present", {
  expect_true(pystr_startswith("www.example.com", "www."))
})

test_that("it works with a string prefix that's not present", {
  expect_false(pystr_startswith("http://example.com", "https://"))
})

test_that("it works with a list of prefixes where one is present", {
  expect_true(pystr_startswith("http://example.com", list("http://", "https://")))
})

test_that("it works with a list of prefixes where none are present", {
  expect_false(pystr_startswith("http://example.com", list("www.", "https://")))
})

test_that("it works with a vector of prefixes where one is present", {
  expect_true(pystr_startswith("http://example.com", c("http://", "https://")))
})

test_that("it works with a vector of prefixes where none are present", {
  expect_false(pystr_startswith("http://example.com", c("www.", "https://")))
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
