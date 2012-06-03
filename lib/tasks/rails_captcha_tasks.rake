namespace :rails_captcha do
  desc 'Generate a batch of rails captchas'
  task :generate => :environment do
    RailsCaptcha::Generator.new
  end
end
