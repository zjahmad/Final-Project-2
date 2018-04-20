class RemovephoneFromInstructor < ActiveRecord::Migration[5.1]
  def self.up
    remove_column :instructors, :phone, :email
  end
end
