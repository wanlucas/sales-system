module Exceptions
  class BaseException < StandardError
    attr_reader :message, :status

    def initialize(message, status = :unprocessable_entity)
      @message = message
      @status = status
      super(message)
    end
  end

  class RecordNotFound < BaseException
    def initialize(message = 'Record not found')
      super(message, :not_found)
    end
  end

  class ValidationError < BaseException
    def initialize(message = 'Validation failed')
      super(message, :unprocessable_entity)
    end
  end
end
