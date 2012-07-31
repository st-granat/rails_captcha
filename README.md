rails_captcha
=============

Rails 3.2 Captcha Engine

Gemfile:

gem "rails_captcha"

Controller example:

class MessagesController < ApplicationController
  include CacheableFlash
  caches_page :index
  # There is no need include rails_captcha
  # Because it is loaded from javascript request on the page

  def index
    # There is no need include rails_captcha too
    @messages = Message.publish.paginate(per_page)
  end

  def create
    @message = Message.new(params[:message])
    @message.known_captcha = session[:captcha]
    @message.captcha = params[:captcha]
    if @message.save
      ...

Model Example:

class Message < ActiveRecord::Base
  acts_as_captcha :field => "wrong captcha"
  ...

View:

= form_for @message, :html => {:class => "simple"} do |f|
  ...
  p
    = form_rails_captcha(@message)
  p
    = f.submit "Save"
= content_for :footer_javascripts do
  = javascript_include_tag "/captcha/load_captcha"

config/initializers/rails_captcha.rb:

require 'rails_captcha'

RailsCaptcha::Config.new(
  :password => 'your_secret_password',
  :colors => {
    :background => '#000',
    :font => "#fff"
  },
  :generate_every => 1
)

Rake Task:

Look:

rake -T | grep rails_captcha
