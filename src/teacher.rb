require ('./src/person.rb')

class Teacher < Person
    def initialize(name = 'Unknown', age, specialization, parent_permission: true)
        super(name, age, parent_permission: parent_permission)
        @specialization = specialization
    end

    def can_use_services?
        true
    end

    def teach
        "Everything in Ruby is an Object"
    end
end
