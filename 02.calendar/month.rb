# 月を扱うバリューオブジェクト
class Month
  attr_reader :value
  MONTH = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].freeze

  def initialize(month)
    @value = month
  end

  def validate
    unless MONTH.include?(@value)
      return false
    end
    true
  end
end
