class Account 
    attr_accessor :pin_code, :balance, :account_status, :exp_date, :account_owner  
    STANDARD_VALIDITY_YRS = 5

    def initialize
    @pin_code = rand(1000..9999)
    @exp_date = set_expire_date
    @account_status = :active
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def deactivate
        @account_status = :deactivated
    end

end
