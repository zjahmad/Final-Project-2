class User < ApplicationRecord
    # relationships
    belongs_to :instructor
    
    # validations
    has_secure_password
    
    validates :username, presence: true, uniqueness: { case_sensitive: false}
    validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }
    validates_format_of :phone, with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes or dots or any other common formats", allow_blank: true }
    validates :password_digest, presence: true, length: { minimum: 4 }  message: "Password must contain atleast 4 characters"
    validates :password_confirmation, presence: true
    
    # callbacks
    before_save :reformat_of_phone
    
    
    
    private
    
    # def self.confirmation
        
    # end
    
    def reformat_of_phone
        phone = self.phone.to_s
        phone.gsub(/[^0-9]/,"")
    end
end
