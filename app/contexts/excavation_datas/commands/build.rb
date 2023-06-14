module Contexts
    module ExcavationDatas
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(digsite_infos_id:)
                    ExcavationInfo.transaction do
                        ExcavationInfo.create(
                            id: Faker::Number.number(digits: 8),
                            type_of_work: @params[:TypeOfWork],
                            work_done_for: @params[:WorkDoneFor],
                            project_duration: @params[:ProjectDuration],
                            project_start_date: @params[:ProjectStartDate],
                            explosives: @params[:explosives],
                            under_ground_over_head: @params[:UndergroundOverhead],
                            horizontal_boring: @params[:horizontal_boring],
                            white_lined: @params[:WhiteLined],
                            locate_instructions: @params[:LocateInstructions],
                            remarks: @params[:Remarks],
                            digsite_infos_id: digsite_infos_id
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end