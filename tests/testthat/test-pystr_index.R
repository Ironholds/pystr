library(pystr)
context("pystr_index")

test_that("it gives the index if sub exists", {
  expect_equal(pystr_index("abcd", "ab"), 1)
})

test_that("it throws an error if sub does not exist", {
  expect_error(pystr_index("abcd", "xy"))
})

test_that("it respects start / end args", {
  expect_equal(pystr_index("12121212", "12", 4, 6), 5)
})

test_that("it works with a character vector", {
  expect_equal(pystr_index(c("abcabc", "xyabc"), "abc"), c(1, 3))
})

test_that("it works with multiple character vectors", {
  expect_equal(pystr_index(c("abcabc", "xyabc"), c("abc", "xy")), c(1, 1))
})
