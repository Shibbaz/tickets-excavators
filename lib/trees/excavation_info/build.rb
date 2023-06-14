module Trees
    module ExcavationInfo
        class Build
            def initialize(params)
                @params = params
            end

            def call
                digsite_info = Trees::DigsiteInfo::Build.new(@params[:DigsiteInfo]).call
                Contexts::ExcavationDatas::Commands::Build.new(@params).call(
                    digsite_infos_id: digsite_info.id
                )
            end
        end
    end
end