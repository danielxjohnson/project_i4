# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require 'rake'

include Rake::DSL
ProjectI::Application.load_tasks

module ::project_i  
  class Application
    include Rake::DSL
  end
end
