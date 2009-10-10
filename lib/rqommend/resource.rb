require 'rubygems'
require '4store-ruby'
require 'erb'
require File.expand_path(File.dirname(__FILE__)) + '/can'

module Rqommend

  class Resource

    def initialize(uri)
      @uri = uri
    end

    def recommendations
      recommendations = []
      Can.cans.each do |can|
        query = can.query
        query = query.split("@INPUT").join("<" + @uri + ">")
        store = FourStore::Store.new can.endpoint, can.options
        results = store.select(query)
        template = can.template
        results.each do |result|
          explanation = handle_template(template, result)
          recommendations << { 'recommendation' => result["OUTPUT"], 'explanation' => explanation }
        end
      end
      recommendations
    end

    def recommendation
      recommendations[rand(recommendations.size)]
    end

    private

    def handle_template(tmpl, result)
      template = ERB.new(tmpl)
      template.result(binding)
    end

  end

end
