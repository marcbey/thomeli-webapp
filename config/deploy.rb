# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'thomeli-webapp'
set :repo_url, 'git@github.com:marcbey/thomeli-webapp.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/rails/thomeli-webapp'

set :rbenv_ruby, File.read('.ruby-version').strip
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{db/production.sqlite3 config/initializers/secret_token.rb}

# Default value for linked_dirs is []
set :linked_dirs, %w{photos bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

before :deploy, 'unicorn:stop'
after :deploy, 'unicorn:start'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end

namespace :test do
  desc 'Test'
  task :test do
    on roles(:app), in: :sequence do
      execute 'ruby -v'
    end
  end
end
