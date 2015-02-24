# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'App'

#This is the path i will set on the remote production machine which is a bare git repo
set :repo_url, 'file:///path/to/bare_repo.git'

set :scm, :git

# Defining where the application code will be put on the production env
set :deploy_to, "/Users/productionuser/projects/recipes"

set :format, :pretty

set :pty, true

set :default_env, { path: "/opt/ruby/bin:$PATH" }

set :bundle_flags, "--deployment --local"

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

