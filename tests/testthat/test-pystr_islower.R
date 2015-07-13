library(pystr)
context("pystr_islower")

test_that("it returns false if there's capitals", {
  expect_false(pystr_islower("abC"))
})

test_that("it returns true if there's no capitals", {
  expect_true(pystr_islower("abc"))
})

test_that("the presence of punctuation and numerics doesn't matter", {
  expect_true(pystr_islower("abc123!"))
})

test_that("it returns false if there are no cased characters", {
  expect_false(pystr_islower("?!."))
})
