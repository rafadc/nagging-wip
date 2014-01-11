require 'yaml'

class FileConfiguration
  def initialize
    @config = YAML.load_file("#{Dir.home}/.nagging_wip.yml")
  end

  def for(key)
    @config[key.to_s]
  end
end
