# -*- encoding: utf-8 -*-

$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'monitrc_parser/version'

Gem::Specification.new do |s|
  s.name = 'monitrc_parser'
  s.version = MonitrcParser::VERSION
  s.summary = 'Parse monitrc files.'
  s.description = s.summary
  s.homepage = 'https://github.com/mmb/monitrc_parser'
  s.authors = ['Matthew M. Boedicker']
  s.email = %w{matthewm@boedicker.org}

  %w{
    treetop
    }.each { |g| s.add_dependency g }

  %w{
    rspec
    }.each { |g| s.add_development_dependency g }

  s.files = `git ls-files`.split("\n")
end
