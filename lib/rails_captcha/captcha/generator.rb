# coding: utf-8
module RailsCaptcha
  class Generator
    def initialize
      generate
    end

    def generate
      require 'etc'
      uid = File.stat("#{Rails.root}/Gemfile").uid
      owner = Etc.getpwuid(uid).name
      return unless Config.options
      return if Config.last_modified && Config.last_modified > Time.now - Config.options[:generate_every]
      path = Rails.root.join(Config.options[:destination])
      Config.captchas.each do |captcha|
        FileUtils.rm_f captcha
      end
      FileUtils.rm_rf path
      FileUtils.mkdir path
      FileUtils.chown_R owner, owner, path if Rails.env.production?
      (1..Config.options[:count]).each do |x|
        image = Image.new Config.options
        path = "#{Config.options[:destination]}/#{Cipher.encrypt(image.code)}.jpg"
        next if File.exists?(path)
        File.open(path, 'w') do |f|
          FileUtils.chown owner, owner, path if Rails.env.production?
          f << image.data.force_encoding("UTF-8")
        end
      end
      GC.start
    end
  end
end
