class User < ApplicationRecord
    # validations
    has_secure_password
    
    validates :username, presence: true, uniqueness: { case_sensitive: false}
    # validates :password_digest, presence: true, message: "Password must contain atleast 4 characters", length: { minimum: 4 }
    # validates :password_confirmation, presence: true
    
    validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }
    validates :phone, format: { with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes only or dots or any other common formats", allow_blank: true }
    
    # callbacks
    before_save :reformat_phone
    
    private
    
    # def self.confirmation
        
    # end
    
    def reformat_phone
        phone = self.phone.to_s  # change to string in case input as all numbers 
        phone.gsub!(/[^0-9]/,"") # strip all non-digits
        self.phone = phone       # reset self.phone to new string
    end
end
