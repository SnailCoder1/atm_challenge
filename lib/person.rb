require './lib/atm.rb'
require './lib/account.rb'


class Person 
    attr_accessor :name, :cash, :account

    def initialize( attrs = {} )
     @name = set_name( attrs[:name] ) 
     @cash = 0
     
    end

    
    def create_account
        @account = Account.new(account_owner: self)
    end 

    def deposit(funds)
        @account.nil? ? missing_account : deposit_funds(funds)
    end
    def withdraw (args = {})
    @account == nil ? missing_account : withdraw_funds(args)
end

    def missing_account
        raise 'No account present'
    end

    def deposit_funds(funds)
       @cash -= funds
       @account.balance += funds
    end 

    def withdraw_funds(args)
        args[:atm] == nil ? missing_atm : atm = args[:atm]
        account = @account
        amount = args[:amount]
        pin = args[:pin]
        response = atm.withdraw(amount, pin, account)
        response[:status] == true ? increase_cash(response) : response
      end

      def increase_cash(response)
        @cash += response[:amount]
      end
    
      def missing_atm
        raise RuntimeError, 'An ATM is required'
      end
    
 
    private

    def set_name(name)
        name.nil? ? missing_name : @name = name
    end

    def missing_name
        raise 'A name is required'
    end
end