#!/usr/bin/env ruby
# frozen_string_literal: true

START_NUM = 1
END_NUM = 20
FIZZ_NUMBER = 3
BUZZ_NUMBER = 5
FIZZ_TEXT = 'Fizz'
BUZZ_TEXT = 'Buzz'

def fizz_buzz
  START_NUM.upto(END_NUM).map do |num|
    if (num % (FIZZ_NUMBER * BUZZ_NUMBER)).zero?
      FIZZ_TEXT + BUZZ_TEXT
    elsif (num % FIZZ_NUMBER).zero?
      FIZZ_TEXT
    elsif (num % BUZZ_NUMBER).zero?
      BUZZ_TEXT
    else
      num.to_s
    end
  end
end

puts fizz_buzz
