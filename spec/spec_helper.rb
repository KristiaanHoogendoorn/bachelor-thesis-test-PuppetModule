require 'rspec-puppet'

fixture_path = File.join(File.dirname(File.expand_path(__FILE__)), 'fixtures')

RSpec.configure do |c|
  c.mock_with :rspec
  c.hiera_config    = File.join(fixture_path, '../../hiera.yaml')
  c.module_path     = File.join(fixture_path, 'modules')
  c.manifest_dir    = File.join(fixture_path, 'manifests')
  c.manifest        = File.join(fixture_path, 'manifests', 'site.pp')
  c.environmentpath = File.join(Dir.pwd, 'spec')
  c.after(:suite) do
      RSpec::Puppet::Coverage.report!
  end
end
