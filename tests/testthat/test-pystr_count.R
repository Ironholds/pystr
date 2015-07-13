library(pystr)
context("pystr_count")

test_that("it doesn't count overlapping occurrences", {
  count = pystr_count("ababab", "aba")
  expect_equal(count, 1)
})

test_that("it counts non-overlapping occurrences", {
  count = pystr_count("babbab", "bab")
  expect_equal(count, 2)
})

test_that("it only counts things within the specified range", {
  count = pystr_count("babbab", "bab", 1, 3)
  expect_equal(count, 1)
})

test_that("it returns 0 when asking for a range outside the string's range", {
  count = pystr_count("ababab", 10, 15)
  expect_equal(count, 0)
})

test_that("it counts substrings not adjacent", {
  expect_equal(pystr_count("a--b--c", "--"), 2)
})

test_that("it counts substrings at the beginning", {
  expect_equal(pystr_count("--a--b", "--"), 2)
})

test_that("it counts substrings at the end", {
  expect_equal(pystr_count("a--b--", "--"), 2)
})

test_that("it counds empty strings", {
  expect_equal(pystr_count("hi", ""), 3)
})
