library(pystr)
context("pystr_split")

test_that("it splits on all occurrences by default", {
  expect_equal(pystr_split("123123", "2"), c("1", "31", "3"))
})

test_that("it splits on only maxsplit occurrences", {
  expect_equal(pystr_split("123123", "2", 1), c("1", "3123"))
})

test_that("it splits on single spaces by default", {
  expect_equal(pystr_split("A B C"), c("A", "B", "C"))
})

test_that("an empty string is a valid separator", {
  expect_equal(pystr_split("ABC", ""), c("A", "B", "C"))
})

test_that("it can split on an empty string with a maxsplit", {
  expect_equal(pystr_split("ABCD", "", 2), c("A", "B", "CD"))
})

test_that("it can split on periods", {
  expect_equal(pystr_split("www.example.com", "."), c("www", "example", "com"))
})

test_that("it can split on multi-character seps", {
  expect_equal(pystr_split("a--b--c", "--"), c("a", "b", "c"))
})

test_that("it can split on multi-character seps with a maxsplit", {
  expect_equal(pystr_split("a--b--c", "--", 1), c("a", "b--c"))
})

test_that("if maxsplit is 0 return the original string", {
  expect_equal(pystr_split("A.B.C", ".", 0), "A.B.C")
})

test_that("it splits if the sep is at the beginning", {
  expect_equal(pystr_split("--a--b", "--"), c("", "a", "b"))
})

test_that("it splits if the sep is at the end", {
  expect_equal(pystr_split("a--b--", "--"), c("a", "b", ""))
})

test_that("it splits correctly if maxsplit = nchar(str) - 1", {
  expect_equal(pystr_split("A.B.C", ".", 2), c("A", "B", "C"))
})
