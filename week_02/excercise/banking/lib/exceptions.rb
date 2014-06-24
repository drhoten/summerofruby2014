class Exceptions
  class InsufficientBalanceWithdrawError < StandardError
    def to_s
      "You do not have enough a sufficient enough balance to make that withdraw. No money for YOU!"
    end
  end

  class WrongDataTypeForDepositError < StandardError
    def to_s
      "The deposit amount must be a number."
    end
  end

  class WrongDataTypeForWithdrawError < StandardError
    def to_s
      "The withdraw amount must be a number."
    end
  end
end