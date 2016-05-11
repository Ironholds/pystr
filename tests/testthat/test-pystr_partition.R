library(pystr)
context("pystr_partition")

test_that("it returns the string itself and two empty strings if sep isn't found", {
  expect_equal(pystr_partition("abcd", "xy")[[1]], c("abcd", "", ""))
})

test_that("it returns before, sep, and after if sep is found", {
  expect_equal(pystr_partition("abcd", "bc")[[1]], c("a", "bc", "d"))
})

test_that("it returns an empty string at the beginning if sep is at the beginning", {
  expect_equal(pystr_partition("abcd", "ab")[[1]], c("", "ab", "cd"))
})

test_that("it returns an empty string at the end if the sep is at the end", {
  expect_equal(pystr_partition("abcd", "cd")[[1]], c("ab", "cd", ""))
})

test_that("it returns a list of character vectors", {
  input = c("A.B.C", "B.C", "C")
  output = list(c("A", ".", "B.C"), c("B", ".", "C"), c("C", "", ""))
  expect_equal(pystr_partition(input, "."), output)
})
