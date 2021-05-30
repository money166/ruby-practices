# 月を扱うバリューオブジェクト
class Month
  attr_reader :value
  MONTH = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

  def initialize(month)
    unless MONTH.include?(month)
      raise "cal: #{month} is neither a month number (1..12) nor a name"
    end
    @value = month
  end
end
