module RailsCaptcha
  class Engine < ::Rails::Engine
    isolate_namespace RailsCaptcha
    #config.autoload_paths << File.expand_path("./captcha/", __FILE__)
    initializer "rails_captcha" do |app|
      ActionController::Base.send :include, RailsCaptcha::Action
      ActiveRecord::Base.send :include, RailsCaptcha::Model
      ActionView::Base.send :include, RailsCaptcha::ApplicationHelper
    end
  end
end
