require 'bundler'
Bundler.require
require './lib/entry.rb'


module Something
  class App < Sinatra::Application
    
   
   
    get '/' do
      @hack = Entry.new(1,"Show transparent cover on hover")
      @hack.css = ".container {font-size: 10px;}"
      @hack.html = "<div class='container'> show html here </div>"
      @result_class = "css#{@hack.id}"
      erb :index
    end

    helpers do 
      def simple_partial(template)
        erb template
      end
    end

  end
end

