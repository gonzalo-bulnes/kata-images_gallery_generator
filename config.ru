require 'rack'

ROOT_DIRECCTORY = 'spec/tmp'
use Rack::Static, urls: [""], root: ROOT_DIRECCTORY, index: 'index.html'

simple_server = proc do |env|
  Rack::Directory.new(ROOT_DIRECCTORY, index: 'index.html').call(env)
end

run simple_server
