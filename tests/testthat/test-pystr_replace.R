library(pystr)
context("pystr_replace")

test_that("it replaces all occurrences by default", {
  expect_equal(pystr_replace("mississippi", "ss", "X"), "miXiXippi")
})

test_that("it only replaces the first count occurrences", {
  expect_equal(pystr_replace("mississippi", "ss", "XX", 1), "miXXissippi")
})

test_that("it can replace with empty strings", {
  expect_equal(pystr_replace("hello", "o", ""), "hell")
})

test_that("it can replace empty strings", {
  expect_equal(pystr_replace("hi", "", "X"), "XhXiX")
})

test_that("it can replace empty strings with a count", {
  expect_equal(pystr_replace("ABC", "", "X", 2), "XAXBC")
})

test_that("if count is 0, return the string itself", {
  expect_equal(pystr_replace("ABCD", "CD", "X", 0), "ABCD")
})
