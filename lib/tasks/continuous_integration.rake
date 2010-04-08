namespace :ci do
  task :copy_yml do
    system("cp /home/production/integrity/database.88mph.yml #{Rails.root}/config/database.yml")
  end

  desc "Prepare for CI and run entire test suite"
  task :build => ['ci:copy_yml', 'db:migrate', 'spec', 'features'] do
  end
end