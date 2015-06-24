require 'rainbow'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)


desc 'Report code quality'
task :rubycritic do

  # check if the rubycritic code quality reporter is available
  `which rubycritic`
  if $?.exitstatus != 0
    abort <<-eos.gsub /^( |\t)+/, ""

      The #{Rainbow('rubycritic').red} code quality reporter is not available.
      You may want to install it in order to report the code quality.

      See #https://github.com/whitesmith/rubycritic for intallation instructions.

    eos
  end

  command = "rubycritic"
  puts <<-eos.gsub /^( |\t)+/, ""

    #{Rainbow('Report the code quality.').blue}
    #{command}

  eos
  success = system('rubycritic')
  exit_status = $?.exitstatus

  abort unless exit_status == 0
end



task default: [:spec, :rubycritic]