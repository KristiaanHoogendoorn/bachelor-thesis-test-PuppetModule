source 'https://rubygems.org'

group :tests do
  gem 'puppetlabs_spec_helper'
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion
else
  gem 'puppet'
end

