class Employee
    attr_accessor :id
    attr_reader :username, :password, :role
    
    def initialize(attrs={})
        @id = attrs[:id]
        @username = attrs[:username]
        @password = attrs[:password]
        @role = attrs[:role] || "rider"
    end

    def rider?
        @role == "rider"
    end

    def manager?
        @role == "manager"
    end

    def csv_fields
        [ self.id, self.username, self.password, self.role ]
    end
end
