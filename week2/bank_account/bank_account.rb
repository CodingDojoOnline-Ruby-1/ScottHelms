class BankAccount
    @@account_count = 0
    # attr_reader :account_number, :checking_balance, :savings_balance, :rate
    def initialize
        @account_number = account_number    # private method
        @checking_balance = 100
        @savings_balance = 100
        @rate = interest_rate               # private method
        @@account_count += 1
    end

    def view_account_number
        puts "Your Account Number is #{@account_number}"
    end
    def deposit_checking *arg1  # splat not needed - was planning to play with this
        @checking_balance += arg1.flatten.reduce(:+)
        puts "After deposit, new Checking balance: #{@checking_balance} for Acc #{@account_number}"
        return "After deposit, new Checking balance: #{@checking_balance} for Acc #{@account_number}"
    end

    def deposit_savings *arg2  # splat not needed - was planning to play with this
        @savings_balance += arg2.flatten.reduce(:+)
        puts "After deposit, new Savings balance: #{@savings_balance} for Acc #{@account_number}"
        return "After deposit, new Savings balance: #{@savings_balance} for Acc #{@account_number}"
    end

    def withdraw_checking amount
        if amount > @checking_balance
            puts " Insufficient Funds in checking!!"
            return "Insufficient Funds in checking!!"
        else
            @checking_balance -= amount
            puts " Checking withdrawal! New Balance: #{@checking_balance}"
            return "Checking withdrawal! New Balance: #{@checking_balance}"
        end
    end

    def withdraw_savings amount
        if amount > @savings_balance
            puts " Insufficient Funds in Savings!!"
            return "Insufficient Funds in Savings!!"
        else
            @savings_balance -= amount
            puts " Savings withdrawal! New Balance: #{@savings_balance}"
            return "Savings withdrawal! New Balance: #{@savings_balance}"
        end
    end

    def view_checking_balance
        puts "Checking Balance is #{@checking_balance} for Account# #{@account_number}"
        return "Checking Balance is #{@checking_balance}"                                            #for RSpec
    end
    def view_savings_balance
        puts "Savings Balance is #{@savings_balance} for Account# #{@account_number}"
        return "Savings Balance is #{@savings_balance}"
    end

    def view_accounts_total
        @total = @savings_balance+@checking_balance
        puts "The value in both your accounts totals: #{@total}"
        return "The value in both your accounts totals: #{@total}"                                 #for RSpec
    end

    def account_information
        puts " Account Information: "
        puts "Acc# #{@account_number}"
        puts "Your Interest Rate is: #{@rate}%"
        if @checking_balance <= 0
            puts "Checking Balance: Nil Nada Zilch - You drained this account, yo!"
        else
            puts "Checking Balance: #{@checking_balance}"
        end
        if @savings_balance <= 0
            puts "Savings Balance has been squandered.  Nothing left here!"
        else
            puts "Savings Total: #{@savings_balance}"
        end
        puts "Accounts Total: #{@savings_balance+@checking_balance}"
        self
    end

    def view_accounts_quantity
        puts "Total number of Bank Accounts: #{@@account_count}"
    end

    private
    def account_number
        @account_number = rand(7**10)
    end

    def interest_rate
        @rate = 1.02
    end
end