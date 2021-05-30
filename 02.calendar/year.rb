# 年を扱うバリューオブへジェクト
require "date"

class Year
  attr_reader :value

  def initialize(year)
    if year < 1970 && year > 2100
      # calコマンドとしての制限ではないが最小の仕様
      # 少なくとも1970年から2100年までは正しく表示されるに合わせている
      raise "年の値は1970~2100の値を入力してください"
    end
    @value = year
  end
end
