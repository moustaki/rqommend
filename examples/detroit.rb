#!/usr/bin/ruby

require '../lib/rqommend/can'
require '../lib/rqommend/resource'

# Artists that are based in Detroit are related
Rqommend::Can.new "
    SELECT *
    WHERE {
      @INPUT <http://dbpedia.org/ontology/homeTown> <http://dbpedia.org/resource/Detroit> .
      @INPUT <http://dbpedia.org/property/name> ?input_name .
      ?OUTPUT <http://dbpedia.org/ontology/homeTown> <http://dbpedia.org/resource/Detroit> .
      ?OUTPUT <http://dbpedia.org/property/name> ?output_name .
      FILTER (@INPUT != ?OUTPUT)
    }", 
    '<%= result["input_name"] %> and <%= result["output_name"] %> are both based in Detroit'

# Artists in the Manchester scene in the 70s are related
Rqommend::Can.new "
      SELECT * WHERE {
        @INPUT 
          a <http://dbpedia.org/class/yago/MusicalGroupsFromManchester> ;
          a <http://dbpedia.org/class/yago/1970sMusicGroups> ;
          <http://dbpedia.org/property/name> ?input_name .
        ?OUTPUT
          a <http://dbpedia.org/class/yago/MusicalGroupsFromManchester> ;
          a <http://dbpedia.org/class/yago/1970sMusicGroups> ;
          <http://dbpedia.org/property/name> ?output_name .
        FILTER (@INPUT != ?OUTPUT)
      }
    ",
    "<%= result['input_name'] %> and <%= result['output_name'] %> were both part of the 70s Manchester scene"


# Trying these rules out
require 'pp'
resource = Rqommend::Resource.new 'http://dbpedia.org/resource/Aretha_Franklin'
pp resource.recommendations
resource = Rqommend::Resource.new 'http://dbpedia.org/resource/Joy_Division'
pp resource.recommendations
