# 年を扱うバリューオブへジェクト
require "date"

class Year
  attr_reader :value

  def initialize(year)
    if year < 1970 && year > 2100
      # calコマンドとしての制限ではないが最小の仕様
      # 少なくとも1970年から2100年までは正しく表示されるに合わせている
      raise "cal: #{year} is neither a year number (1970..2100) nor a name"
    end
    @value = year
  end
end
