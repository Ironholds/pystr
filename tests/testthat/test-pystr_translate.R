library(pystr)
context("pystr_translate")

test_that("it translates numbers", {
  map = pystr_maketrans("123", "abc")
  expect_equal(pystr_translate("1 2 3 456", map), "a b c 456")
})

test_that("it translates chars", {
  map = pystr_maketrans("abc", "123")
  expect_equal(pystr_translate("abc456", map), "123456")
})

test_that("different things can be mapped to the same char", {
  map = pystr_maketrans("abcd", "rrrr")
  expect_equal(pystr_translate("abcdefg", map), "rrrrefg")
})
