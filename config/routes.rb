RailsCaptcha::Engine.routes.draw do
  match "/captcha.js" => "captcha#captcha", :as => :captcha
  match "/load_captcha.js" => "captcha#load_captcha", :as => :load_captcha, :format => "js"
end
