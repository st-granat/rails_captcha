# coding: utf-8
module RailsCaptcha
  class Config
    ONE_DAY = 24 * 60 * 60

    @@options = {
      :password => 'captcha',
      :colors => {
        :background => '#FFFFFF',
        :font => '#080288'
      },
      # number of captcha images to generate
      :count => Rails.env.production? ? 100 : 3,
      :destination => "public/images/captchas/#{Rails.env.to_s}",
      :dimensions => {
        # canvas height (px)
        :height => 32,
        # canvas width (px)
        :width => 110
      },
      :generate_every => Rails.env.production? ? ONE_DAY * 1 : ONE_DAY * 10000,
      # http://www.imagemagick.org/RMagick/doc/image2.html#implode
      :implode => 0.2,
      :letters => {
        # text baseline (px)
        :baseline => 25,
        # number of letters in captcha
        :count => 6,
        :ignore => ['a','e','i','o','u','l','j','q','v','f','t'],
        # font size (pts)
        :points => 36,
        # width of a character (used to decrease or increase space between characters) (px)
        :width => 17
      },
      :ttf => File.expand_path("#{File.dirname(__FILE__)}/../resources/captcha.ttf"),
      # http://www.imagemagick.org/RMagick/doc/image3.html#wave
      :wave => {
        # range is used for randomness (px)
        :wavelength => (40..60),
        # distance between peak and valley of sin wave (px)
        :amplitude => 2
      }
    }

    def initialize(options={})
      @@options.merge!(options)
    end

    def self.captchas
      Dir["#{@@options[:destination]}/*.jpg"]
    end

    def self.codes
      self.captchas.collect do |f|
        File.basename f, '.jpg'
      end
    end

    def self.exists?(code)
      File.exists?("#{@@options[:destination]}/#{code}.jpg")
    end

    def self.options
      @@options
    end

    def self.last_modified
      file = self.captchas.first
      if file && File.exists?(file)
        File.mtime(file)
      else
        nil
      end
    end
  end
end
