# Have not run thorough tests, yet, but everything should be chainable !?
class BankAccount
    @@account_count = 0
    attr_reader :account_number, :checking_balance, :savings_balance, :rate
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
        self
    end
    def deposit_savings *arg2  # splat not needed - was planning to play with this
        @savings_balance += arg2.flatten.reduce(:+)
        puts "After deposit, new Savings balance: #{@savings_balance} for Acc #{@account_number}"
        self
    end
    def withdraw_checking
        if @checking_balance <= 0
            puts " Insufficient Funds in checking!!"
            self
        else
            @checking_balance -= 100
            puts " Checking withdrawal! New Balance: #{@checking_balance}"
            self
        end
    end
    def withdraw_savings
        if @savings_balance <= 0
            puts " Insufficient Funds in Savings!!"
            self
        else
            @savings_balance -= 100
            puts " Savings withdrawal! New Balance: #{@savings_balance}"
            self
        end
    end
    def view_checking_balance
        puts "Checking Balance is #{@checking_balance} for Account# #{@account_number}"
        self
    end
    def view_savings_balance
        puts "Savings Balance is #{@savings_balance} for Account# #{@account_number}"
        self
    end
    def view_accounts_total
        @total = @savings_balance+@checking_balance
        puts "The value in both your accounts totals: #{@total}"
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

#   V generates new account # V
acc_number = BankAccount.new.view_account_number
puts "\n"

#   V views then deposits (via argument) into checking, then savings V
BankAccount.new.view_checking_balance.deposit_checking(25).view_savings_balance.deposit_savings(410)
puts "\n"

# V um, total # of bank accounts V
BankAccount.new.view_accounts_quantity
puts "\n"

#   V attempts to overdraw from checking (withdrawal is set to 100) V
BankAccount.new.view_checking_balance.withdraw_checking.withdraw_checking
puts "\n"

#   V zero-out savings with a single withdrawal V
BankAccount.new.view_savings_balance.withdraw_savings
puts "\n"

#   V deposits into savings then displays total of checking + savings V
BankAccount.new.view_savings_balance.deposit_savings(165).view_accounts_total
puts "\n"


BankAccount.new.account_information
puts "\n"

#   V shows account_information AFTER both accounts have been drained (accounts for nil) V
BankAccount.new.withdraw_checking.withdraw_savings.account_information
puts "\n"

# V um, total # of bank accounts V
BankAccount.new.view_accounts_quantity
puts "\n"
