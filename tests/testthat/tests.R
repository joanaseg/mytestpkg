library(mytestpkg)
context("test if my first package works")

test_that("my function works", {
  expect_equal(followers(5), c(5, 6, 7))
})


test_that("my second function works", {
  expect_equal(half(10), 5)
})

