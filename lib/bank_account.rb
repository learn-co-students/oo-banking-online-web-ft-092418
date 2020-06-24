class BankAccount

    attr_accessor :balance, :status
    attr_reader :name
    
    def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
    end   

    def deposit(amt)
        @balance += amt
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?

        (self.status == "open" && self.balance > 0) ? true : false
    end

    def close_account
        self.status = "closed"
    end


    # def back_project(proj)
    #     self.backed_projects << proj unless self.backed_projects.include?(proj)
    #     proj.add_backer(self) unless proj.backers.include?(self)
    # end
  end