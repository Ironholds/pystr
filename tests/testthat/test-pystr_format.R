library(pystr)
context("pystr_format")

test_that("numeric arguments work with individual args", {
  original = "Hello {1}, my name is {2}."
  formatted = pystr_format(original, "World", "Nicole")
  expected = "Hello World, my name is Nicole."
  expect_equal(formatted, expected)
})

test_that("numeric arguments work with a list of args", {
  original = "Hello {1}, my name is {2}."
  formatted = pystr_format(original, list("World", "Nicole"))
  expected = "Hello World, my name is Nicole."
  expect_equal(formatted, expected)
})

test_that("named arguments works with individual args", {
  original = "Hello {thing}, my name is {name}."
  formatted = pystr_format(original, thing="World", name="Nicole")
  expected = "Hello World, my name is Nicole."
  expect_equal(formatted, expected)
})

test_that("named arguments works with a list of args", {
  original = "Hello {thing}, my name is {name}."
  formatted = pystr_format(original, list(thing="World", name="Nicole"))
  expected = "Hello World, my name is Nicole."
  expect_equal(formatted, expected)
})

test_that("numeric arguments work with args showing up in multiple places", {
  original = "The name is {2}. {1} {2}."
  formatted = pystr_format(original, "James", "Bond")
  expected = "The name is Bond. James Bond."
  expect_equal(formatted, expected)
})

test_that("numeric list of arguments work with args showing up in multiple places", {
  original = "The name is {2}. {1} {2}."
  formatted = pystr_format(original, list("James", "Bond"))
  expected = "The name is Bond. James Bond."
  expect_equal(formatted, expected)
})

test_that("named arguments work with args showing up in multiple places", {
  original = "The name is {last}. {first} {last}."
  formatted = pystr_format(original, first="James", last="Bond")
  expected = "The name is Bond. James Bond."
  expect_equal(formatted, expected)
})

test_that("named list of arguments work with args showing up in multiple places", {
  original = "The name is {last}. {first} {last}."
  formatted = pystr_format(original, list(first="James", last="Bond"))
  expected = "The name is Bond. James Bond."
  expect_equal(formatted, expected)
})

test_that("character and numeric args work at the same time", {
  original = "Hello {1}, you have {2} new notifications!"
  formatted = pystr_format(original, "Nicole", 0)
  expected = "Hello Nicole, you have 0 new notifications!"
  expect_equal(formatted, expected)
})

test_that("the same string is returned if the args are empty", {
  original = "Hello {1}."
  formatted = pystr_format(original)
  expected = "Hello {1}."
  expect_equal(formatted, expected)
})

test_that("the same string is returned if the single list arg is empty", {
  original = "Hello {1}."
  formatted = pystr_format(original, list())
  expected = "Hello {1}."
  expect_equal(formatted, expected)
})

test_that("it can format a single indexed parameter - individual arg", {
  original = "Hello {1}."
  formatted = pystr_format(original, "World")
  expected = "Hello World."
  expect_equal(formatted, expected)
})

test_that("it can format a single indexed parameter - character vector arg", {
  original = "Hello {1}."
  formatted = pystr_format(original, c("World"))
  expected = "Hello World."
  expect_equal(formatted, expected)
})

test_that("it can format a single indexed parameter - list arg", {
  original = "Hello {1}."
  formatted = pystr_format(original, list("World"))
  expected = "Hello World."
  expect_equal(formatted, expected)
})

test_that("It can format a single named parameter - individual arg", {
  original = "Hello {thing}."
  formatted = pystr_format(original, thing="World")
  expected = "Hello World."
  expect_equal(formatted, expected)
})

test_that("It can format a single named parameter - named vector arg", {
  original = "Hello {thing}."
  formatted = pystr_format(original, c(thing="World"))
  expected = "Hello World."
  expect_equal(formatted, expected)
})

test_that("It can format a single named parameter - named list arg", {
  original = "Hello {thing}."
  formatted = pystr_format(original, list(thing="World"))
  expected = "Hello World."
  expect_equal(formatted, expected)
})

test_that("It works with data.frames", {
  supers <- data.frame(first=c("Bruce", "Hal", "Clark", "Diana"),
                       last=c("Wayne", "Jordan", "Kent", "Prince"),
                       is=c("Batman", "Green Lantern", "Superman", "Wonder Woman"))

  sentences = pystr_format("{first} {last} is really {is} but you shouldn't call them {first} in public.", supers)

  expect_equal(sentences[1], "Bruce Wayne is really Batman but you shouldn't call them Bruce in public.")
  expect_equal(sentences[2], "Hal Jordan is really Green Lantern but you shouldn't call them Hal in public.")
  expect_equal(sentences[3], "Clark Kent is really Superman but you shouldn't call them Clark in public." )
  expect_equal(sentences[4], "Diana Prince is really Wonder Woman but you shouldn't call them Diana in public.")
})

test_that("it works with a characte vector", {
  input = c("Hello {world}!", "Hello {world}")
  output = c("Hello thing!", "Hello thing")
  expect_equal(pystr_format(input, world="thing"), output)
})
