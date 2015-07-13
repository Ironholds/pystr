library(pystr)
context("pystr_zfill")

test_that("it fills up to the width", {
  expect_equal(pystr_zfill("42", 5), "00042")
})

test_that("it leaves the minus sign at the beginning", {
  expect_equal(pystr_zfill("-42", 5), "-0042")
})

test_that("it leaves the plus sign at the beginning", {
  expect_equal(pystr_zfill("+42", 5), "+0042")
})

test_that("it returns the string itself if width <= nchar(str)", {
  expect_equal(pystr_zfill("hello", 4), "hello")
})
