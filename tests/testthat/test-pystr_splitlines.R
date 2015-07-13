library(pystr)
context("pystr_splitlines")

test_that("it splits correctly when \r\n is first", {
  expected = c("First", "Second", "Third")
  expect_equal(pystr_splitlines("First\r\nSecond\rThird"), expected)
})

test_that("it splits correctly when \r\n is second", {
  expected = c("First", "Second", "Third")
  expect_equal(pystr_splitlines("First\nSecond\r\nThird"), expected)
})

test_that("it splits correctly when \r\n is last", {
  expected = c("First", "Second", "Third")
  expect_equal(pystr_splitlines("First\nSecond\nThird\r\n"), expected)
})

test_that("it keeps the ends correctly when \r\n is first", {
  expected = c("First\r\n", "Second\r", "Third")
  expect_equal(pystr_splitlines("First\r\nSecond\rThird", TRUE), expected)
})

test_that("it keepds the ends correctly when \r\n is second", {
  expected = c("First\n", "Second\r\n", "Third")
  expect_equal(pystr_splitlines("First\nSecond\r\nThird", TRUE), expected)
})

test_that("it keeps the ends correctly when \r\n is last", {
  expected = c("First\n", "Second\n", "Third\r\n")
  expect_equal(pystr_splitlines("First\nSecond\nThird\r\n", TRUE), expected)
})

test_that("it returns the string itself if there are no linebreaks", {
  expect_equal(pystr_splitlines("fdsa"), "fdsa")
})
