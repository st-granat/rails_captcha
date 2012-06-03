# coding: utf-8
class RailsCaptcha::CaptchaController < RailsCaptcha::ApplicationController
	acts_as_captcha

  def captcha
    reset_captcha
		text = session[:captcha].blank? ? "" : session[:captcha]
    render :text => text
  end

  def load_captcha
    reset_captcha
    respond_to do |format|
      format.js
    end
  end
end
