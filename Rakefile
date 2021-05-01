require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :console do 
    def reload!
        load_all('lib')
    end

    Pry.start 

end
