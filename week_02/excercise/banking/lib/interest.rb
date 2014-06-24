module Interest
  def calculateInterest(principal, rate, days)
    principal * (1 + (rate / 100) * (days /  365))
  end
end