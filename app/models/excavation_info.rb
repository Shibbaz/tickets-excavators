class ExcavationInfo < ApplicationRecord
    def project_start_date
        super.strftime('%Y/%m/%d %H:%M:%S')
    end

    def digsite_info
        loader = Dataloader.new do |ids|
            digsite_infos = DigsiteInfo.find(*ids)
            [digsite_infos]
        end
        if self.digsite_infos_id.eql? nil
            return {}
        end
        promise = loader.load(self.digsite_infos_id)
        promise.sync
    end
end
