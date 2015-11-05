module Model  
  class Config
    include Singleton
      attr_reader :environmental_specfic_config
      attr_reader :config_file_contents
        
    class << self
    end

    def initialize
      @config_file_contents = config_file_contents
      @environment_specific_config = @config_file_contents[current_config]
      environment = ENV['ENVIRONMENT']
      unless environment && environment.strip != '' 
        environment = 'test'
      end
      @environment_specific_config.each do |k, v| 
        @environment_specific_config[k] = v.to_s.gsub('ENVIRONMENT', environment)
      end
    end 

    def value_for(key_name)
      raise "there is no key '#{key_name}' for the config that you specified" if @environment_specific_config[key_name].nil?
      @environment_specific_config[key_name]
    end

    def self.[](key_name)
      instance.value_for(key_name)
    end

    def self.current_config
      instance.current_config
    end

    def current_config
      default_config = ENV['ENVIRONMENT']
      default_config.nil? ? abort("No ENVIRONMENT supplied, and no default config found in config.yml") : default_config
    end

    def config_file_contents
      config_yaml = File.join(File.dirname(__FILE__), '../../config/config.yml')
      raise "the config yaml file could not be found" unless File.exists?(config_yaml)
      YAML::load(File.open(config_yaml))
    end
  end
end