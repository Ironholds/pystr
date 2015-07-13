library(pystr)
context("pystr_join")

test_that("it joins numbers", {
  expect_equal(pystr_join(c(1, 2, 3), "+"), "1+2+3")
})

test_that("it joins strings", {
  expect_equal(pystr_join(c("A", "B", "C"), "*"), "A*B*C")
})

test_that("it joins on empty strings by default", {
  expect_equal(pystr_join(c("A", "B", "C")), "ABC")
})
