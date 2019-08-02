require "webix_sinatra_gem/version"
require "sinatra"

def erb(template)
    path = File.expand_path("#{template}")
    ERB.new(File.read(path)).result(binding)
end

module WebixSinatraGem
    class Error < StandardError; end

    class Server
        def server
            get "/" do
                erb :home
            end
        end
    end
end


