require 'rspec'
require_relative "bank_account"

RSpec.describe BankAccount do
    it "when view_checking_balance is invoked, method retrieves account balance" do
        expect(BankAccount.new.view_checking_balance).to eq("Checking Balance is 100")
    end

    it "when view_accounts_total is invoked, method return total sum of checking and savings " do
        expect(BankAccount.new.view_accounts_total).to eq("The value in both your accounts totals: 200")
    end

    it "when withdraw_checking is invoked, method return new balance" do
        expect(BankAccount.new.withdraw_checking(99)).to eq("Checking withdrawal! New Balance: 1")
    end

    it "when withdraw_savings is invoked, method return new balance" do
        expect(BankAccount.new.withdraw_savings(98)).to eq("Savings withdrawal! New Balance: 2")
    end

    it "when withdraw_checking is overdrawn, method returns warning" do
        expect(BankAccount.new.withdraw_checking(101)).to eq("Insufficient Funds in checking!!")
    end

    it "when withdraw_savings is overdrawn, method returns warning" do
        expect(BankAccount.new.withdraw_savings(205)).to eq("Insufficient Funds in Savings!!")
    end

    it "when user tries to print # of bank accounts, raise error" do
        expect{BankAccount.new.account_number}.to raise_error(NoMethodError)        # NOTE THE CURLY BRACKETS for raise_error!!
    end

    it "when user attempts to set interest rate, raise error" do
        expect{BankAccount.new.interest_rate(2.5)}.to raise_error(NoMethodError)    # NOTE THE CURLY BRACKETS!!
    end

    it "when user attempts to set attribute, raise error" do
        expect{BankAccount.new.checking_balance(5)}.to raise_error(NoMethodError)   # NOTE THE CURLY BRACKETS!!
        expect{BankAccount.new.savings_balance(15.25)}.to raise_error(NoMethodError)   # NOTE THE CURLY BRACKETS!!
    end
end