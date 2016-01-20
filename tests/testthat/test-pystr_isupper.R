library(pystr)
context("pystr_isupper")

test_that("it returns false if there's lowercase", {
  expect_false(pystr_isupper("ABc"))
})

test_that("it returns true if it's all capitals", {
  expect_true(pystr_isupper("ABC"))
})

test_that("the presence of punctuation and numerics doesn't matter", {
  expect_true(pystr_isupper("ABC123!"))
})

test_that("it returns false if there are no cased characters", {
  expect_false(pystr_isupper("?!."))
})

test_that("Vectors are supported", {
  expect_equal(pystr_isupper(c("?!.", "Foo", "FOO")), c(FALSE, FALSE, TRUE))
})

test_that("NA values are supported", {
  expect_equal(pystr_isupper(c("?!.", "Foo", NA)), c(FALSE, FALSE, NA))
})
