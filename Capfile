require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
instal_plugin Capostrano::SCM::Git
require 'capistrano/rails/console'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }