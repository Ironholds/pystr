library(pystr)
context("pystr_rsplit")

test_that("it splits on all occurrences by default", {
  expect_equal(pystr_rsplit("123123", "2")[[1]], c("1", "31", "3"))
})

test_that("it splits on single spaces by default", {
  expect_equal(pystr_rsplit("A B C")[[1]], c("A", "B", "C"))
})

test_that("an empty string is a valid separator", {
  expect_equal(pystr_rsplit("ABC", "")[[1]], c("A", "B", "C"))
})

test_that("it can split on periods", {
  expect_equal(pystr_rsplit("www.example.com", ".")[[1]], c("www", "example", "com"))
})

test_that("it can split on multi-character seps", {
  expect_equal(pystr_rsplit("a--b--c", "--")[[1]], c("a", "b", "c"))
})

test_that("if maxsplit is 0 return the original string", {
  expect_equal(pystr_rsplit("A.B.C", ".", 0)[[1]], "A.B.C")
})

test_that("it splits from the right", {
  expect_equal(pystr_rsplit("A.B.C", ".", 1)[[1]], c("A.B", "C"))
})

test_that("it splits on empty strings from the right", {
  expect_equal(pystr_rsplit("ABCD", "", 2)[[1]], c("AB", "C", "D"))
})

test_that("it splits if the sep is at the beginning", {
  expect_equal(pystr_rsplit("--a--b", "--")[[1]], c("", "a", "b"))
})

test_that("it splits if the sep is at the end", {
  expect_equal(pystr_rsplit("a--b--", "--")[[1]], c("a", "b", ""))
})

test_that("it returns a list of character vectors", {
  input = c("A.B.C", "B.C", "C")
  output = list(c("A", "B", "C"), c("B", "C"), "C")
  expect_equal(pystr_rsplit(input, "."), output)
})
