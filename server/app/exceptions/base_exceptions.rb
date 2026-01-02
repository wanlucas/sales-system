module Exceptions
  class RecordNotFound < StandardError
    def initialize(message = 'Record not found')
      super(message)
    end
  end

  class ValidationError < StandardError
    attr_reader :errors

    def initialize(errors = {})
      @errors = errors
      super(errors.to_s)
    end
  end

  class UnauthorizedError < StandardError
    def initialize(message = 'Unauthorized')
      super(message)
    end
  end
end
