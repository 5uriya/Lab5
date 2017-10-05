
library(testthat)


test_that('invalid input',{
      expect_that(func1(11,"chennai"), throws_error())
      expect_that(func1("chennai",11),throws_error())
      expect_that(func1(11,13),throws_error())
      expect_that(func1(11,11),throws_error())
      expect_that(func1("chennai","chennai"),throws_error())
      expect_that(func1("CHENNAI","chennai"),throws_error())
      expect_that(func1("chennai","CHENNAI"),throws_error())
      expect_that(func1(-11,13),throws_error())
      expect_that(func1(11,-13),throws_error())
      expect_that(func1("chennai",-"bangalore"),throws_error())
      expect_that(func1(-"chennai","bangalore"),throws_error())
          })




