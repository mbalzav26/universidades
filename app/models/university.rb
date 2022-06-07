class University < ApplicationRecord
    has_many :programs


    def to_s
        self.universidad
    end
end
