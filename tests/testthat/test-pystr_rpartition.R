library(pystr)
context("pystr_rpartition")

test_that("it returns two empty strings and the string itself if sep isn't found", {
  expect_equal(pystr_rpartition("abcd", "xy")[[1]], c("", "", "abcd"))
})

test_that("it returns before, sep, and after if sep is found", {
  expect_equal(pystr_rpartition("abcd", "bc")[[1]], c("a", "bc", "d"))
})

test_that("it returns an empty string at the beginning if sep is at the beginning", {
  expect_equal(pystr_rpartition("abcd", "ab")[[1]], c("", "ab", "cd"))
})

test_that("it returns an empty string at the end if the sep is at the end", {
  expect_equal(pystr_rpartition("abcd", "cd")[[1]], c("ab", "cd", ""))
})

test_that("it splits at the highest-indexed occurrence of sep", {
  expect_equal(pystr_rpartition("abcdbcd", "bc")[[1]], c("abcd", "bc", "d"))
})

test_that("it returns a list of character vectors", {
  input = c("A.B.C", "B.C", "C")
  output = list(c("A.B", ".", "C"), c("B", ".", "C"), c("", "", "C"))
  expect_equal(pystr_rpartition(input, "."), output)
})
