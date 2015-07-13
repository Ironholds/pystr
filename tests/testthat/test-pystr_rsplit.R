library(pystr)
context("pystr_rsplit")

test_that("it splits on all occurrences by default", {
  expect_equal(pystr_rsplit("123123", "2"), c("1", "31", "3"))
})

test_that("it splits on single spaces by default", {
  expect_equal(pystr_rsplit("A B C"), c("A", "B", "C"))
})

test_that("an empty string is a valid separator", {
  expect_equal(pystr_rsplit("ABC", ""), c("A", "B", "C"))
})

test_that("it can split on periods", {
  expect_equal(pystr_rsplit("www.example.com", "."), c("www", "example", "com"))
})

test_that("it can split on multi-character seps", {
  expect_equal(pystr_rsplit("a--b--c", "--"), c("a", "b", "c"))
})

test_that("if maxsplit is 0 return the original string", {
  expect_equal(pystr_rsplit("A.B.C", ".", 0), "A.B.C")
})

test_that("it splits from the right", {
  expect_equal(pystr_rsplit("A.B.C", ".", 1), c("A.B", "C"))
})

test_that("it splits on empty strings from the right", {
  expect_equal(pystr_rsplit("ABCD", "", 2), c("AB", "C", "D"))
})

test_that("it splits if the sep is at the beginning", {
  expect_equal(pystr_rsplit("--a--b", "--"), c("", "a", "b"))
})

test_that("it splits if the sep is at the end", {
  expect_equal(pystr_rsplit("a--b--", "--"), c("a", "b", ""))
})
