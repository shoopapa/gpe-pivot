require "webix_sinatra_gem/version"
require "sinatra"
require "json"

module WebixSinatraGem
    
  class Error < StandardError; end

  class Viewer < Sinatra::Base
       
    configure do
      set :root, File.dirname(__FILE__)
      set :title, "Spectrum Protect Connect"
      set :static, true
      enable :corss_origin
    end
    
    before do
      response.headers['Access-Control-Allow-Origin'] = '*'
    end
    
    get "/" do
        erb :home
    end
    
    get "/data" do
        File.read("lib/public/gal.json")
    end

    def json_gen
        JSON.generate([
            {  name: "rich", age: 49, sex: :male     },
            {  name: "bob", age: 53, sex: :male     },
            {  name: "sue", age: 51, sex: :female     },
            {  name: "joe", age: 19, sex: :male     },
            {  name: "ben", age: 17, sex: :male     },
            {  name: "lizzi", age: 15, sex: :female     },
            {  name: "harry", age: 14, sex: :male     },
            {  name: "jessi", age: 11, sex: :male     },
            {  name: "richie", age: 8, sex: :male     },
            {  name: "jamie", age: 6, sex: :male     },
        ])
    end

  end

end
