class Student < ApplicationRecord
    # relationships
    belongs_to :family
    has_many :registrations
    has_many :camps, through: :registrations
    
    # validations
    validates_presence_of :first_name, :last_name
    validates :family_id, presence: true, numericality: { greater_than: 0, only_integer: true }
    ratings_array = [0] + (0..3000).to_a
    validates :rating, numericality: { only_integer: true }, inclusion: { in: ratings_array }
    
    # scopes
    scope :alphabetical, -> { order('last_name, first_name') }
    scope :active, -> { where(active: true) }
    scope :inactive, -> { where(active: false) }
    scope :below_rating, -> (ceiling) { where('rating < ?', ceiling) }
    scope :at_or_above_rating, -> (floor) { where ('rating >=?', floor) }
    
    
    # callbacks
    before_save :adjusted_rating
    
    private
    
    def adjusted_rating
        self.rating = 0 if self.rating.nil?
    end
    
    # methods
    def name
        last_name + ", " + first_name
    end
  
    def proper_name
        first_name + " " + last_name
    end
    
    def age
        now = Time.now.utc.to_date
        now.year - date_of_birth.year - (date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
    end
    
end
