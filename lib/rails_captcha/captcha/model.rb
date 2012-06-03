# coding: utf-8
module RailsCaptcha
  module Model
    def self.included(base)
      base.extend ActMethods
    end

    module ActMethods
      def acts_as_captcha(options={})
        extend ClassMethods
        include InstanceMethods
        attr_reader :captcha, :known_captcha
        cattr_accessor :captcha_options
        self.captcha_options = options
        validate :captcha_must_match_known_captcha
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def captcha=(c)
        @captcha = c || ''
      end

      def known_captcha=(c)
        @known_captcha = c || ''
      end

      def captcha_must_match_known_captcha
        return true if self.captcha.nil? || self.known_captcha.nil?
        decrypted = RailsCaptcha::Cipher.decrypt(self.known_captcha)
        if self.captcha.strip.downcase != decrypted
          if self.captcha_options[:base]
            self.errors.add_to_base(
              case self.captcha_options[:base]
              when true
                I18n.t("rails_captcha.enter_the_correct_captcha")
              else
                self.captcha_options[:base]
              end
            )
          else
            self.errors.add(:captcha,
              case self.captcha_options[:field]
              when true, nil
                I18n.t("rails_captcha.wrong_captcha")
              else
                self.captcha_options[:field]
              end
            )
          end
        end
      end
    end
  end
end
