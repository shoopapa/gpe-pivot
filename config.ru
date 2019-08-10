require 'rubygems'
require 'bundler'

Bundler.require

require 'webix_sinatra_gem'

set :bind, '0.0.0.0'
set :port, 9292 #set your port!o

run WebixSinatraGem::Viewer
