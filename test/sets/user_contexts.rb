module Contexts
    module UsersContexts
        
        def create_users
            @zee = FactoryBot.create(:user, username: "chow", password:"lol", password_confirmation: "lol", role: "instructor", phone: "1234567891")
            # @mac = FactoryBot.create(:user, username: "apple", phone: "1323214567")
            # @lee = FactoryBot.create(:user, username: "low", password:"pop", password_confirmation: "pop", role: "parent", phone: "6549871236")
            # @pee = FactoryBot.create(:user, username: "plow", password:"iki", password_confirmation: "iki", role: "admin", phone: "999-999-9999")
        end
        
        def delete_users
            @zee.delete
            # @lee.delete
            # @pee.delete
        end
    end
end