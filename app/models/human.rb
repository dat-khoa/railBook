class Human < ApplicationRecord
  def Human.naucao
    return "cao"
  end

  TIEN = "$$$$"

  def an food
    @@rice = "com"
    return @@rice + " + " + food + " => shit, mat " + TIEN
  end

  def ngu
    return "Zzzz + dang tieu hoa: " + @@rice + " khong co " + TIEN
  end

  def choi game
    return game + " => money, mat " + TIEN
  end
end
