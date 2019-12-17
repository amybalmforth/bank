## Bank tech test

This is a back-end program written to simulate a bank account.

There are methods for the following actions:

Bank class -

1) Depositing money (taking two parameters - date of deposit and amount)
2) Withdrawing money (taking two parameters - date of withdrawal and amount)

Bank statement class -

3) Printing an account statement

The program can be interacted with via IRB.

I have structured the program in two objects/classes - Bank class and Bank Statement class. I originally had one class (Bank) taking care of all responsibilities as I felt all responsibilities were closely related, however I later chose to refactor into two classes. This way, all the responsibility for keeping track of account activity and printing statements is looked after solely in the Bank Statement class. I made the access to the bank balance itself private.

I spent an hour planning before starting to write tests, thinking about what functions the program needed and how these could be accomplished. I took a TDD approach writing the program. As the program grew I made some changes/improvements and ended up deleting previous tests where I was repeating myself.

Deposits and withdrawals must be positive numbers (higher than zero), otherwise a message is given asking for a number higher than zero.

### Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Instructions for running the program

1) git clone https://github.com/amybalmforth/bank
2) run "bundle install"
3) run "rubocop"
4) run "rspec"
5) run irb:

```
2.2.10 :001 > require "./lib/bank.rb"
 => true
2.2.10 :002 > bank = Bank.new(statement = BankStatement.new)
 => #<Bank:0x007ff09a2e3118 @balance=0.0, @bank_statement=#<BankStatement:0x007ff09a2e3168 @statement=[]>>
2.2.10 :003 > bank.deposit('10/01/2012', -1)
 => "Deposits must be higher than zero"
2.2.10 :004 > bank.withdraw('14/01/2012', -1)
 => "Withdrawals must be higher than zero"
2.2.10 :005 > bank.deposit('10/01/2012', 1000)
 => ["10/01/2012 || 1000.00 || || 1000.00"]
2.2.10 :006 > bank.deposit('13/01/2012', 2000)
 => ["10/01/2012 || 1000.00 || || 1000.00", "13/01/2012 || 2000.00 || || 3000.00"]
2.2.10 :007 > bank.withdraw('14/01/2012', 500)
 => ["10/01/2012 || 1000.00 || || 1000.00", "13/01/2012 || 2000.00 || || 3000.00", "14/01/2012 || || 500.00 || 2500.00"]
2.2.10 :008 > puts statement.print_statement
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
