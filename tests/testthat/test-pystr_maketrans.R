library(pystr)
context("pystr_maketrans")

test_that("it throws error if x and y are inequal lengths", {
  expect_error(pystr_maketrans("abc", "1234"))
})

test_that("it works with numerics as keys", {
  expect_equal(pystr_maketrans("123", "abc"), list("1"="a", "2"="b", "3"="c"))
})

test_that("it works with chars as keys", {
  expect_equal(pystr_maketrans("abc", "123"), list(a="1", b="2", c="3"))
})

test_that("it works with a combination of numerics and chars as keys", {
  expect_equal(pystr_maketrans("1a", "xy"), list("1"="x", a="y"))
})
