module Rqommend

  class Can

    @@cans = []

    def initialize(query, template, endpoint = 'http://dbpedia.org/sparql')
      raise "Canned query needs one @INPUT" if query.split("@INPUT").size == 1
      raise "Canned query needs one ?OUTPUT" if query.split("?OUTPUT").size == 1
      @query = query
      @template = template
      @endpoint = endpoint
      @@cans << self
    end

    def self.cans
      @@cans
    end

    def query
      @query
    end

    def template
      @template
    end

    def endpoint
      @endpoint
    end

  end

end
