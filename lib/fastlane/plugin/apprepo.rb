#!/usr/bin/env ruby

# encoding: utf-8

require 'json'
require 'fastlane'
require 'fastlane_core'

require_relative 'apprepo/version'

module Fastlane
  # Root module of the plugin (seems like a class-loader)
  module Apprepo
    # Return all .rb files inside the "actions" and "helper" directory
    def self.all_classes
      Dir[File.expand_path('*/{actions,helper}/*.rb', File.dirname(__FILE__))]
    end
  end

  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8

  # By default we want to import all available actions and helpers
  # A plugin can contain any number of actions and plugins
  Fastlane::Apprepo.all_classes.each do |current|
    puts 'Requiring ' + current
    require current
  end
end
