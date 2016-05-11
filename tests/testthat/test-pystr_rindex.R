library(pystr)
context("pystr_rindex")

test_that("it returns the highest index if sub exists", {
  expect_equal(pystr_rindex("abcdab", "ab"), 5)
})

test_that("it throws an error if sub doesn't exist", {
  expect_error(pystr_rindex("abcd", "xy"))
})

test_that("it works with a character vector", {
  expect_equal(pystr_rindex(c("123123", "123"), "123"), c(4, 1))
})

test_that("it respsects start / end args", {
 expect_equal(pystr_rindex("12121212", "12", 4, 6), 5)
})

test_that("it works with multiple character vectors", {
  expect_equal(pystr_rindex(c("123123", "123"), c("123", "3")), c(4, 3))
})
