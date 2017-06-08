module Admins
  class BaseController < ApplicationController
    http_basic_authenticate_with name: 'admin', password: 'secret'

    layout 'layouts/admin'

    def execute
      render_response(find_and_create_service.execute)
    end

    private
    def find_and_create_service
      clazz = "Admins::#{find_module}::#{find_action}".constantize
      clazz.new(params)
    end

    def find_module
      controller_name.camelize
    end

    def find_action
      action_name.camelize
    end

    def render_response(data)
      respond_to do |format|
        format.html { @result = data }
      end
    end
  end
end
