require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase

  should belong_to(:camp)
  should belong_to(:student)
  should have_one(:family).through(:student)
  
  should validate_presence_of(:camp_id)
  should validate_presence_of(:student_id)
  
  context "Within context" do
    setup do
      create_families
      create_students
      create_curriculums
      create_locations
      create_users
      create_camps
      create_registrations
      
    end
    
    teardown do
      delete_users
      delete_camps
      delete_registrations
      delete_locations
      delete_families
      delete_curriculums
      delete_students
    end
  
    # should "check if student is active in the system" do
    #   bad_assignment = FactoryBot.create(:registration, student: @draw, camp: @camp1)
    #   deny bad_assignment.valid?
    # end
    
    # should "check if camp is active in the system" do
    #   bad_assignment = FactoryBot.create(:registration, camp: @camp3, student: @ash)
    #   deny bad_assignment.valid?
    # end 
      
  end
end
