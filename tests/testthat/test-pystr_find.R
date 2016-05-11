library(pystr)
context("pystr_find")

test_that("it finds the lowest index of the substring", {
  expect_equal(pystr_find("abcabc", "abc"), 1)
})

test_that("it finds the lowest index of the substring within start and end", {
  expect_equal(pystr_find("abcabc", "abc", 2), 4)
})

test_that("it returns -1 when the substring isn't there", {
  expect_equal(pystr_find("abc", "xy"), -1)
})

test_that("it finds the index when start and end both truncated", {
  expect_equal(pystr_find("abcxyzabc", "xyz", 4, 7), 4)
})

test_that("it works with a character vector", {
  expect_equal(pystr_find(c("abcabc", "xyabc"), "abc"), c(1, 3))
})


test_that("it works with multiple character vectors", {
  expect_equal(pystr_find(c("abcabc", "xyabc"), c("abc", "xy")), c(1, 1))
})
