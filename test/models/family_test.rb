require 'test_helper'

class FamilyTest < ActiveSupport::TestCase
  
  should belong_to(:user)
  should have_many(:students)
  should have_many(:registrations).through(:students)
  
  should validate_presence_of(:family_name)
  should validate_presence_of(:parent_first_name)
  
  
  context "Within context" do
    setup do 
      create_families
    end
    
    teardown do
      delete_families
    end
    
  end  
    
end
