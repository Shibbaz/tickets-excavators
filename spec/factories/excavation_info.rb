require 'faker'

FactoryBot.define do
    factory :excavation_info do
        id { Faker::Number.within(range: 1..1000) }
        type_of_work { "rpr man hole tops" }
        work_done_for {"gpc" }
        project_duration { "60 days" }
        project_start_date { DateTime.new }
        explosives { "No" }
        under_ground_over_head { "Underground" }
        horizontal_boring { "Road, Driveway and Sidewalk" }
        white_lined {"No" }
        locate_instructions {"locate along the r/o/w on both sides of the rd - including the rd itself - from inter to inter" }
        remarks {"" }
        digsite_infos_id { create(:digsite_info).id }
    end
end