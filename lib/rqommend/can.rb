module Rqommend

  class Can

    attr_reader :query, :template, :endpoint, :options
    
    @@cans = []

    def initialize(query, template, endpoint = DEFAULT_ENDPOINT, options = DEFAULT_OPTIONS)
      raise "Canned query needs one @INPUT" if query.split("@INPUT").size == 1
      raise "Canned query needs one ?OUTPUT" if query.split("?OUTPUT").size == 1
      @query = query
      @template = template
      @endpoint = endpoint
      @options = options
      @@cans << self
    end

    def self.cans
      @@cans
    end

  end

end
