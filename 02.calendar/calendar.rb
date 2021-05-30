#!/usr/bin/env ruby
# frozen_string_literal: true

require "optparse"
require "date"
require "./year"
require "./month"

class Calendar
  WEEK = %w[日 月 火 水 木 金 土]
  SPACE_SIZE = 2
  MIN_WEEK_INDEX = 0
  MAX_WEEK_INDEX = 6
  MAX_DIGIT = 2
  attr_reader :year, :month

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
    puts "#{@month.value}月#{@year.value}".center((SPACE_SIZE * 2) * MAX_WEEK_INDEX)
    puts WEEK.join("  ")
  end

  ## TODO:ここもう少しきれいにかけそうなきがする。week_indexのインクリメントが分かりづらい
  def print_weeks
    first_day = Date.new(@year.value, @month.value, 1)
    last_day = Date.new(@year.value, @month.value, -1)

    # TODO: 2がマジックナンバーだが表現に困ったため現状このまま
    # 曜日に対して2スペース 曜日と曜日の間隔で2スペース使用している
    print " " * SPACE_SIZE * 2 * first_day.wday
    week_index = first_day.wday
    (1..last_day.mday).each do |day|
      # (" " * SPACE_SIZE)は曜日と曜日の間隔で2スペース
      print day.to_s.rjust(MAX_DIGIT).to_s + (" " * SPACE_SIZE)
      if is_week_end?(week_index)
        week_index = MIN_WEEK_INDEX
        print "\n"
      else
        week_index += 1
      end
    end
  end

  def is_week_end?(week_index)
    week_index == MAX_WEEK_INDEX
  end
end

opt = ARGV.getopts("m:", "y:")
input_year = opt["y"].to_i == 0 ? Date.today.year : opt["y"].to_i
input_month = opt["m"].to_i == 0 ? Date.today.month : opt["m"].to_i

begin
  year = Year.new(input_year)
  month = Month.new(input_month)
  calendar = Calendar.new(year, month)
  calendar.show
rescue => error
  puts error
end


