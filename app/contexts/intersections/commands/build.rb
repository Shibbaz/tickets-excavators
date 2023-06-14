module Contexts
    module Intersections
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call(itoi_ids: [])
                    Intersection.transaction do
                        Intersection.create(
                            id: Faker::Number.number(digits: 8),
                            itoi_ids: itoi_ids
                        )
                    end
                rescue => e
                    { error: e.message }
                end
            end
        end
    end
end