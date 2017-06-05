class Animal < ApplicationRecord

	has_many :prey_id
	has_many :predator_id

end
