module Contexts
    module Intersections
        class Repository
            def initialize(adapter: Intersection)
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
                [ItoI: Contexts::Itois::Repository.new.load(object.itoi_ids)]
            end
        end
    end
end