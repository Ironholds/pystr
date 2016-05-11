library(pystr)
context("pystr_swapcase")

test_that("it works", {
  expect_equal(pystr_swapcase("aBc"), "AbC")
})

test_that("it leaves non-cased characters alone", {
  expect_equal(pystr_swapcase("aBc!"), "AbC!")
})

test_that("it works when there are only non-cased characters", {
  expect_equal(pystr_swapcase("?!;"), "?!;")
})

test_that("it works with a character vector", {
  expect_equal(pystr_swapcase(c("aBc!", "aBc")), c("AbC!", "AbC"))
})
