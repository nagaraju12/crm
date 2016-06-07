class AddDetailsToUsers < ActiveRecord::Migration
  def change
  	 add_column :users, :date_of_visit, :date
  end
end
