module Contexts
    module StudentContexts
        
        def create_students
            @ash = FactoryBot.create(:student, family: @ahmad, first_name: "Ash", last_name: "Ketchum", date_of_birth: "2002-02-02", rating: 500, active: true )
            @draw = FactoryBot.create(:student, family: @rand, first_name: "Dee", last_name: "Lon", date_of_birth: "2005-02-02", rating: 300, active: false )
            # @hex = FactoryBot.create(:student, family: @derp, first_name: "Helena", date_of_birth: "1998-4-5", rating: 1000)
        end
        
        def delete_students
            @ash.delete
            @draw.delete
        end
    end
end