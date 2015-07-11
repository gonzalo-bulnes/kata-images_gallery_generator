require 'html/proofer'
require 'rainbow'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

RSpec::Core::RakeTask.new(:features) do |config|
  config.pattern = 'spec/features/**/*_spec.rb'
end

begin
  require 'inch/rake'

  Inch::Rake::Suggest.new(:inch) do |suggest|
    suggest.args << "--private"
    suggest.args << "--pedantic"
  end
rescue LoadError
  desc 'Inch rake task not available'
  task :inch do
  abort 'Inch rake task is not available. Be sure to install inch as a gem or plugin'
  end
end

namespace :validate do
  desc 'Verify HTML files are valid.'
  task :html do
    system 'images_gallery generate spec/fixtures/works.xml spec/tmp > /dev/null'
    HTML::Proofer.new('spec/tmp', disable_external: true, check_html: true).run
  end
end

task default: [:spec, 'validate:html', :inch]
