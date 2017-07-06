require 'active_support/all'
require 'appium_lib'
require 'rspec/expectations'
require 'date'
require 'cucumber/ast'
require 'pry'
require 'faker'

require_relative 'screen_actions'
require_relative 'mercari_app'
require_relative 'mercari_logger'

APP_PATH = ENV['APP'] ||  File.join(File.dirname(__FILE__), "..", "..", "Mercari_com.mercariapp.mercari.apk")
PLATFORM_NAME = ENV['PLATFORM_NAME'] || 'iOS'

DEFAULT_IMPLICIT_TIMEOUT = 3
DEFAULT_EXPLICIT_TIMEOUT = 4

def caps
    { caps:       { deviceName: (ENV['DEVICE'] || "Android"),
                    platformName: 'Android',
                    app: APP_PATH,
                    appPackage: 'com.mercariapp.mercari',
                    #appActivity: 'com.kouzoh.mercari.activity.IntroActivity', or 'com.kouzoh.mercari.activity.HomeActivity'
                    appWaitActivity: 'com.kouzoh.mercari.activity.IntroActivity',
                    newCommandTimeout: '3600'},
      appium_lib: { wait: DEFAULT_IMPLICIT_TIMEOUT,
                    debug: true } }
end


Appium::Driver.new(caps)
Appium.promote_appium_methods ScreenActions
Appium.promote_appium_methods MercariApp

$wait = Selenium::WebDriver::Wait.new(:timeout => DEFAULT_EXPLICIT_TIMEOUT)

include Logging


World do
  MercariApp.new
end

