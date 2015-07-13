library(pystr)
context("pystr_lstrip")

test_that("it strips spaces by default", {
  expect_equal(pystr_lstrip("  spacious  "), "spacious  ")
})

test_that("it strips characters until it encounters one not in chars", {
  expect_equal(pystr_lstrip("www.example.com", "w."), "example.com")
})
