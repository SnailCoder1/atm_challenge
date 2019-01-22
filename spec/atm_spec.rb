require './lib/atm.rb'

describe ATM do
    it'has $1000 on init' do
        expect(subject.funds).to eq 1000
    end

    it'reduce amount on withdraw' do
        subject.withdraw 50
        expect(subject.funds).to eq 950
    end
    
end
