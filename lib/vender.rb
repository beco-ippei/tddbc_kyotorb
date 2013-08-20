class Vender
  def initialize
    @charge = 0
  end

  def insert(money)
    @charge += money
  end

  def total
    @charge
  end

  def pay_back
    @charge
  end
end
