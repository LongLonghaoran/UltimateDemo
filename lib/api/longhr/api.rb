module Longhr
  class API < Grape::API
    version 'v1', using: :path, vendor: 'longhr'
    format :json
    prefix :api
    #帮助方法，可直接在以下method中使用
    helpers do
      def logger
        API.logger
      end
    end



    resource :statuses do
      desc 'just test'
      get '/:id' do
        logger.info "已收到第一个请求"
        present :result, "why can't it show 中文?"
      end
    end

  end
end
