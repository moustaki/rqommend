#!/usr/bin/ruby

require '../lib/rqommend/can'
require '../lib/rqommend/resource'

# Artists that are based in Detroit are related
canned = Rqommend::Can.new '
    SELECT ?input_name ?output_name ?OUTPUT
    WHERE {
      @INPUT <http://dbpedia.org/ontology/homeTown> <http://dbpedia.org/resource/Detroit> .
      @INPUT <http://dbpedia.org/property/name> ?input_name .
      ?OUTPUT <http://dbpedia.org/ontology/homeTown> <http://dbpedia.org/resource/Detroit> .
      ?OUTPUT <http://dbpedia.org/property/name> ?output_name .
    }', '<%= result["input_name"] %> and <%= result["output_name"] %> are both based in Detroit'


resource = Rqommend::Resource.new 'http://dbpedia.org/resource/Aretha_Franklin'
require 'pp'
pp resource.recommendations
