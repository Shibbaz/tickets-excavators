module Contexts
    module ExcavationInfos
        class Repository
            def initialize(adapter: ExcavationInfo)
                @adapter = adapter
            end
            
            def load(id)
                loader = Dataloader.new do |ids|
                    object = @adapter.find(*ids)
                    self.format(object)
                end
                if id.eql? nil
                    return {}
                end
                promise = loader.load(id)
                promise.sync
            end

            private
            def format(object)
                [
                    TypeOfWork: object.type_of_work,
                    WorkDoneFor: object.work_done_for,
                    ProjectDuration: object.project_duration,
                    ProjectStartDate: object.project_start_date,
                    Explosives: object.explosives,
                    UnderGroundOverhead: object.under_ground_over_head,
                    HorizontalBoring: object.horizontal_boring,
                    Whitelined: object.white_lined,
                    LocateInstructions: object.locate_instructions,
                    Remarks: object.remarks,
                    DigsiteInfo: Contexts::DigsiteInfos::Repository.new.load(object.digsite_infos_id)
                ]
            end
        end
    end
end