module Trees
    module AdressInfo
        class Build
            def initialize(params)
                @params = params
            end

            def call
                adress = Contexts::AdressDigsites::Commands::Build.new(
                    @params[:Adress]
                ).call
                street = Contexts::StreetDigsites::Commands::Build.new(
                    @params[:Street]
                ).call
                adress_info = Contexts::AdressInfos::Commands::Build.new(@params).call(
                    adress_id: adress.id,
                    street_id: street.id    
                )
            end
        end
    end
end