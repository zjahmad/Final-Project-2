require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  should belong_to(:family)
  should have_many(:registrations)
  should have_many(:camps).through(:registrations)
  
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:family_id)
  
  context "Within context" do
    setup do
      create_families
      create_students
    end
    
    teardown do
      delete_students
    end
    
    # should "test that name method works" do
    #   assert_equal "Ash, Ketchum", @ash.name
    # end
    
    # should "test that proper name method works" do
    #   assert_equal "Dee Lon", @draw.proper_name
    # end
    
    # should "test that age method works" do
    #   assert_equal 16, @ash.age
    # end
    
  end 
end
