class CreatePins < ActiveRecord::Migration

   
def change
	create_table :pins do |t|
		t.string :title
		t.text :blurb
		t.float :lng
		t.float :lat
	end

end




end