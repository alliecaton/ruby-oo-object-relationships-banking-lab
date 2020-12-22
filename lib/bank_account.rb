class BankAccount
    
attr_accessor :balance, :status, :transfer
attr_reader :name

@@all = []

    def initialize(name, balance= 1000, status= "open")
        @name = name 
        @balance = balance 
        @status = status 
        save
    end 

    def save 
        @@all << self
    end

    def deposit(num)
        @balance += num
      end 

    def withdraw(num)
        @balance -= num
    end 

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid? 
        @status == "open" && @balance > 0
    end

    def close_account
        @status = "closed"
    end 

end
