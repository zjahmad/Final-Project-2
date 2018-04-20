module Contexts
    module RegistrationContexts
        def create_registrations
            @r1 = FactoryBot.create(:registration, camp: @camp1, student: @ash)
            @r2 = FactoryBot.create(:registration, camp: @camp3, student: @draw)
        end
        
        def delete_registrations
            @r1.delete
            @r2.delete
        end
    end
end