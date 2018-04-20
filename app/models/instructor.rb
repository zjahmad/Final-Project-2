class Instructor < ApplicationRecord
  # relationships
  # belongs_to :user
  has_many :camp_instructors
  has_many :camps, through: :camp_instructors

  # validations
  validates_presence_of :first_name, :last_name

  # scopes
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :needs_bio, -> { where('bio IS NULL') }
  # scope :needs_bio, -> { where(bio: nil) }  # this also works...

  # class methods
  def self.for_camp(camp)
    # the 'instructive way'... (which I told you if you asked me for help)
    CampInstructor.where(camp_id: camp.id).map{ |ci| ci.instructor }
    # the easy way... 
    # camp.instructors
  end

  # callbacks
  # before_save :reformat_phone
  

  # instance methods
  def name
    last_name + ", " + first_name
  end
  
  def proper_name
    first_name + " " + last_name
  end

  # private
  # def reformat_phone
  #   phone = self.phone.to_s  # change to string in case input as all numbers 
  #   phone.gsub!(/[^0-9]/,"") # strip all non-digits
  #   self.phone = phone       # reset self.phone to new string
  # end
  
  

end
