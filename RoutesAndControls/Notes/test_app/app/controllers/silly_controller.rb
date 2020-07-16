class SillyController < ApplicationController
    skip_before_action :verify_authenticity_token

    def fun
        render plain: params[:message]
    end


    def time
        render json: params

    end

    def super
         render json: params
    end
end

#params
# 1) Query String
# 2_ Request body
# 3) URL Params(Wildcards)