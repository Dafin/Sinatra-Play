# Number the file in order of the sequence - User built first as pins belong to user


class CreateUsers < ActiveRecord::Migration

    # include DataMapper::Resource

    
	def change
		create_table :users do |t|
			t.string :forename
			t.string :surname
		end

	end




end