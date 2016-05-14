library(pystr)
context("pystr_endswith")

test_that("it works with a string suffix that's present", {
  expect_true(pystr_endswith("selfie.jpg", ".jpg"))
})

test_that("it works with a string suffix that's not present", {
  expect_false(pystr_endswith("selfie.jpg", ".png"))
})

test_that("it works with a start and end range", {
  expect_true(pystr_endswith("hello world", "ello", 1, 5))
})

test_that("it returns FALSE when start and end are out of bounds", {
  expect_false(pystr_endswith("hi", "hi", 10, 15))
})

test_that("all strings end with an empty string", {
  expect_true(pystr_endswith("hello", ""))
})

test_that("it works with a character vector", {
  expect_equal(pystr_endswith(c("selfie.jpg", "selfie.png"), ".jpg"), c(TRUE, FALSE))
})

test_that("it works with multiple character vectors", {
  expect_equal(pystr_endswith(c("selfie.jpg", "selfie.png"), c(".jpg", ".png")), c(TRUE, TRUE))
})

test_that("it recycles arguments", {
 input = c("fdsa.jpg", "fdsa.png", "fdsa.jpg", "fdsa.png")
 output = rep(TRUE, 4)

 expect_equal(pystr_endswith(input, c(".jpg", ".png")), output)
})

test_that("it works with an unicode string suffix that's present", {
  str <- "çlass"
  suffix <- "ass"
  expect_true(pystr_endswith(str, suffix))
})

test_that("it works with a unicode suffix", {
  str <- "baçk"
  suffix <- "açk"
  expect_true(pystr_endswith(str, suffix))
})
