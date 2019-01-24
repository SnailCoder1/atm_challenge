require './lib/atm.rb'


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

    def missing_account
        raise 'No account present'
    end

    def deposit_funds(funds)
       @cash -= funds
    end 
 
    private

    def set_name(name)
        name.nil? ? missing_name : @name = name
    end

    def missing_name
        raise 'A name is required'
    end
end