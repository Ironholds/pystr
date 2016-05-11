library(pystr)
context("pystr_rfind")

test_that("it finds the highest index of the substring", {
  expect_equal(pystr_rfind("abcabc", "abc"), 4)
})

test_that("it finds the highest index of the substring within start and end", {
  expect_equal(pystr_rfind("abcabc", "abc", 1, 4), 1)
})

test_that("it returns -1 when the substring isn't there", {
  expect_equal(pystr_rfind("abc", "xy"), -1)
})

test_that("it finds the index when start and end both truncate", {
  expect_equal(pystr_rfind("abcxyzabc", "xyz", 4, 7), 4)
})

test_that("it works with a character vector", {
  expect_equal(pystr_rfind(c("123123", "123"), "123"), c(4, 1))
})

test_that("it works with multiple character vectors", {
  expect_equal(pystr_rfind(c("123123", "12345"), c("123", "45")), c(4, 4))
})
