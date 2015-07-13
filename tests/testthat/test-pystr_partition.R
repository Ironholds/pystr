library(pystr)
context("pystr_partition")

test_that("it returns the string itself and two empty strings if sep isn't found", {
  expect_equal(pystr_partition("abcd", "xy"), c("abcd", "", ""))
})

test_that("it returns before, sep, and after if sep is found", {
  expect_equal(pystr_partition("abcd", "bc"), c("a", "bc", "d"))
})

test_that("it returns an empty string at the beginning if sep is at the beginning", {
  expect_equal(pystr_partition("abcd", "ab"), c("", "ab", "cd"))
})

test_that("it returns an empty string at the end if the sep is at the end", {
  expect_equal(pystr_partition("abcd", "cd"), c("ab", "cd", ""))
})
