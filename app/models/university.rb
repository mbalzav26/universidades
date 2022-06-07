class University < ApplicationRecord
    has_many :programs, dependent: :delete_all


    def to_s
        self.universidad
    end
end
