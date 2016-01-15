library(pystr)
context("pystr_center")

test_that("the extra space is put on the right if there's an odd amount of spaces to fill", {
  original = "hello"
  centered = pystr_center(original, 10, "*")
  expect_equal(centered, "**hello***")
})

test_that("the extra space is distributed evenly if there's an even amount of spaces to fill", {
  original = "hello"
  centered = pystr_center(original, 11, "*")
  expect_equal(centered, "***hello***")
})

test_that("spaces are used by default", {
  original = "s"
  centered = pystr_center(original, 3)
  expect_equal(centered, " s ")
})

test_that("the original string is returned if width <= nchar(str)", {
  original = "hello"
  centered = pystr_center(original, 3)
  expect_equal(centered, "hello")
})

test_that("spaced are maintained in the middle", {
  original = "hello world"
  centered = pystr_center(original, 15, "*")
  expect_equal(centered, "**hello world**")
})

test_that("it works with character vectors", {
  original = c("hello", "world")
  centered = pystr_center(original, 7, "*")
  expect_equal(centered, c("*hello*", "*world*"))
})


test_that("it works with NAs", {
  original = c("hello", NA)
  centered = pystr_center(original, 7, "*")
  expect_equal(centered, c("*hello*", NA))
})
