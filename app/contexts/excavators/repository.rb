module Contexts
    module Excavators
        class Repository
            def initialize(adapter: Excavator)
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
                    CompanyName: object.company_name,
                    Address: object.address,
                    City: object.city,
                    State: object.state,
                    Zip: object.zip,
                    CrewOnsite: object.crew_on_site,
                    FieldContact: Contexts::FieldContacts::Repository.new.load(object.field_contacts_id),
                    Contact: Contexts::Contacts::Repository.new.load(object.contacts_id)
                ]
            end
        end
    end
end