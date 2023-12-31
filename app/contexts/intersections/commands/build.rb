module Contexts
    module Intersections
        module Commands
            class Build
                def initialize(params)
                    @params = params
                end

                def call()
                    itoi_ids = []
                    Intersection.transaction do
                        Itoi.transaction do
                            @params[:ItoI].each do |itoi|
                                itoi = Contexts::Itois::Commands::Build.new(itoi).call
                                itoi_ids << itoi.id
                            end
                        end
                        Intersection.create(
                            id: SecureRandom.uuid,
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