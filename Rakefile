require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'test/*.rb'
end

task :open do
  `open http://lemon-party.dev`
end

namespace :pow do
  task :install do
    `curl get.pow.cx | sh`
  end

  task :link do
    `cd ~/.pow && ln -s #{Dir.pwd}`
  end
end

task default: :test
