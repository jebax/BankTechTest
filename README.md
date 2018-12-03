# BankTechTest

This is my attempt at the Bank tech test, in which I strived to achieve the highest-quality code possible, using a test-driven, OO approach. I used Ruby and RSpec to complete this challenge.

## My approach

I used 4 classes in my approach: `BankAccount`, `Statement`, `TransactionList`, and `Transaction`. The user interacts with the `BankAccount` class to make deposits and withdrawals via the command line. I used dependency injection in each class to entirely isolate them. Each class is unit tested in isolation, with dependencies mocked in RSpec, and I employed feature tests to test the high-level functionality of my code.
The `TransactionList` stores `Transaction` objects, which each have data on their time of creation, deposit and withdrawal amounts, and the account balance at the time of the transaction.
When a user makes a deposit or withdrawal, a transaction is added to their `Statement`, which in turn adds a new `Transaction` object to the `TransactionList`. When the user prints their statement, each transaction is formatted inside the `Statement` object, then returned along with headers of 'date', 'credit', 'debit', and 'balance'.

## Example of app in use
```
$ irb

# The user requires all dependencies, located in the /lib folder
2.2.3 :001 > require './lib/bank_account'
 => true
2.2.3 :002 > require './lib/statement'
 => true
2.2.3 :003 > require './lib/transaction_list'
 => true
2.2.3 :004 > require './lib/transaction'
 => true
2.2.3 :005 > account = BankAccount.new
 => #<BankAccount:0x007fbf630bc938 @balance=0, @statement=#<Statement:0x007fbf630bc898 @transaction_list=#<TransactionList:0x007fbf630bc848 @transaction_class=Transaction, @transactions=[]>>>
2.2.3 :006 > account.deposit(1000)
 => [#<Transaction:0x007fbf630ae798 @time=2018-12-03 16:19:22 +0000, @deposit=1000.0, @withdrawal=nil, @balance=1000.0>]
2.2.3 :007 > account.deposit(2000)
 => [#<Transaction:0x007fbf630ae798 @time=2018-12-03 16:19:22 +0000, @deposit=1000.0, @withdrawal=nil, @balance=1000.0>, #<Transaction:0x007fbf630a5800 @time=2018-12-03 16:19:25 +0000, @deposit=2000.0, @withdrawal=nil, @balance=3000.0>]
2.2.3 :008 > account.withdraw(500)
 => [#<Transaction:0x007fbf630ae798 @time=2018-12-03 16:19:22 +0000, @deposit=1000.0, @withdrawal=nil, @balance=1000.0>, #<Transaction:0x007fbf630a5800 @time=2018-12-03 16:19:25 +0000, @deposit=2000.0, @withdrawal=nil, @balance=3000.0>, #<Transaction:0x007fbf6400b740 @time=2018-12-03 16:19:29 +0000, @deposit=nil, @withdrawal=500.0, @balance=2500.0>]
2.2.3 :009 > account.view_statement
 => "date || credit || debit || balance\n03/12/2018 || 1000.00 || || 1000.00\n03/12/2018 || 2000.00 || || 3000.00\n03/12/2018 || || 500.00 || 2500.00"
2.2.3 :010 > puts account.view_statement
date || credit || debit || balance
03/12/2018 || 1000.00 || || 1000.00
03/12/2018 || 2000.00 || || 3000.00
03/12/2018 || || 500.00 || 2500.00
 => nil
2.2.3 :011 > exit
```
