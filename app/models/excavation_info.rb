class ExcavationInfo < ApplicationRecord
    def project_start_date
        super.strftime('%Y/%m/%d %H:%M:%S')
    end
end
