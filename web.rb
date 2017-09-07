require 'sinatra/base'

module TimetasticBot
  class Web < Sinatra::Base
    get '/' do
      'Time is passing by'
    end
  end
end

