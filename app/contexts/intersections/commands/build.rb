module Contexts
    module Intersections
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(itoi_ids: [])
                    Intersection.transaction do
                        entity = Intersection.new(
                            itoi_ids: itoi_ids
                        )
                        entity.save!
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end