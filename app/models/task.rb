class Task < ApplicationRecord
	# two methods to add default value: false. This on is best practice (as you dont have to migrate anymore)
	# attribute :completed, :boolean, default: false
end
