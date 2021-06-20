# 年を扱うバリューオブへジェクト
require "date"

class Year
  attr_reader :value

  def initialize(year)
    @value = year
  end

  def valid?
    # calコマンドとしての制限ではないが最小の仕様
    # 少なくとも1970年から2100年までは正しく表示されるに合わせている
    if @value < 1970 || @value > 2100
      return false
    end
    true
  end
end
