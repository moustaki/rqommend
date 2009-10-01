#!/usr/bin/ruby

require '../lib/rqommend/can'
require '../lib/rqommend/resource'

# Artists that are based in Detroit are related
canned = Rqommend::Can.new '
    SELECT ?INPUT ?OUTPUT
    WHERE {
      ?INPUT <http://dbpedia.org/ontology/homeTown> <http://dbpedia.org/resource/Detroit> .
      ?OUTPUT <http://dbpedia.org/ontology/homeTown> <http://dbpedia.org/resource/Detroit> .
    }', '<%= input %> and <%= output %> are both based in Detroit'


resource = Rqommend::Resource.new 'http://dbpedia.org/resource/Aretha_Franklin'
require 'pp'
pp resource.recommendations
