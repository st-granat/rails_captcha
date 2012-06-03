module RailsCaptcha
  module ApplicationHelper
    def form_rails_captcha(object)
      render :partial => "rails_captcha/captcha/form", :locals => {:object => object}
    end
  end
end
