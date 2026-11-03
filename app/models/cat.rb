class Cat < ApplicationRecord
    belongs_to :user, optional: true
end
