module Contexts
    module ExcavationDatas
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(digsite_infos_id:)
                    ExcavationInfo.transaction do
                        obj =ExcavationInfo.create(
                            id: SecureRandom.uuid,
                            type_of_work: @params[:TypeOfWork],
                            work_done_for: @params[:WorkDoneFor],
                            project_duration: @params[:ProjectDuration],
                            project_start_date: @params[:ProjectStartDate],
                            explosives: @params[:Explosives],
                            under_ground_over_head: @params[:UnderGroundOverhead],
                            horizontal_boring: @params[:HorizontalBoring],
                            white_lined: @params[:Whitelined],
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