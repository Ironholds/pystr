library(pystr)
context("pystr_rindex")

test_that("it returns the highest index if sub exists", {
  expect_equal(pystr_rindex("abcdab", "ab"), 5)
})

test_that("it throws an error if sub doesn't exist", {
  expect_error(pystr_rindex("abcd", "xy"))
})
