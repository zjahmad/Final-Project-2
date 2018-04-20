class Registration < ApplicationRecord
    # relationships
    belongs_to :camp
    belongs_to :student
    has_one :family, through: :student
    
    # validations
    validates :camp_id, presence: true, numericality: { greater_than: 0, only_integer: true }
    validates :student_id, presence: true, numericality: { greater_than: 0, only_integer: true }
    
    # scopes
    scope :alphabetical, -> { joins(:student).order('last_name, first_name') }
    scope :for_camp, -> (camp_id) { where("camp_id = ?", camp_id) }
    
    private
    
    # def student_is_active_in_the_system
    #     return if self.student.nil?
    #     errors.add(:student, "is not currently active") unless self.student.active
    # end
    
    # def camp_is_active_in_the_system
    #     return if self.camp.nil?
    #     errors.add(:camp, "is not currently active") unless self.camp.active
    # end
    
end
