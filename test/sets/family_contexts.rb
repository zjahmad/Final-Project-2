module Contexts
    module FamilyContexts
        def create_families
            @ahmad = FactoryBot.create(:family, user: @zee,  family_name: "lol", parent_first_name: "Javed")
            @rand = FactoryBot.create(:family, user: @zee, family_name: "ree", parent_first_name: "Ron" )
            # @derp = FactoryBot.create(:family, user: @mac, family_name: "Hallo", parent_first_name: "Genz")
        end
        
        def delete_families
            @ahmad.delete
            @rand.delete
        end
    end
end
