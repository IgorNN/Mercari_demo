require 'log4r'
require 'log4r/yamlconfigurator'
require 'log4r/outputter/datefileoutputter'
include Log4r


module Logging
  def logger
    return @logger if @logger

    log4r_config= YAML.load_file(File.join(File.dirname(__FILE__),"../config/log4r.yml"))
    log_cfg = YamlConfigurator
    log_cfg.decode_yaml( log4r_config['log4r_config'] )

    @logger = Log4r::Logger['Mercari']
#config.log_level = DEBUG


#    @logger = Logger.new 'test'
#    outputter = Outputter.stdout
#    outputter.formatter = PatternFormatter.new(:pattern => "%l - #{self.class} - %m")
#    @logger.outputters = outputter
#    @logger

  end
end

