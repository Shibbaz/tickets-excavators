module Contexts
    module FieldContacts
        class Repository
            def initialize(adapter: FieldContact)
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
                    Name: object.name,
                    Phone: object.phone,
                    Email: object.email,
                ]
            end
        end
    end
end