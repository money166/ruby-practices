#!/usr/bin/env ruby
# frozen_string_literal: true

require "optparse"
require "date"
require_relative "year"
require_relative "month"

class Calendar
  WEEK = %w[Su Mo Tu We Th Fr Sa].freeze
  MAX_WEEK_INDEX = 6
  MAX_DIGIT = 2

  def initialize(year, month)
    @year = year
    @month = month
  end

  def show
    print_header
    print_weeks
  end

  private

  def print_header
    puts "#{@month.value}月#{@year.value}".center(WEEK.size * MAX_DIGIT + (WEEK.size - 1))
    puts WEEK.join(" ")
  end

  def print_weeks
    first_day = Date.new(@year.value, @month.value, 1)
    last_day = Date.new(@year.value, @month.value, -1)

    # 曜日と曜日とその間隔で3スペース使用している
    print "   " * first_day.wday
    (first_day..last_day).each do |day|
      # (" " * SPACE_SIZE)は曜日と曜日の間隔で1スペース
      print day.mday.to_s.rjust(MAX_DIGIT) + " "
      if day.saturday?
        print "\n"
      end
    end
  end
end

opt = ARGV.getopts("m:", "y:")
input_year = opt["y"]&.to_i || Date.today.year
input_month = opt["m"]&.to_i || Date.today.month

year = Year.new(input_year)
unless year.valid?
  puts "cal: year #{input_year} not in range 1970..2100"
  exit
end

month = Month.new(input_month)
unless month.valid?
  puts "cal: #{input_month} is neither a month number (1..12) nor a name"
  exit
end

calendar = Calendar.new(year, month)
calendar.show
