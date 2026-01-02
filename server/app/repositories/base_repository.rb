module Repositories
  class BaseRepository
    def initialize(model_class)
      @model_class = model_class
    end

    def find(id)
      record = @model_class.find_by(id: id)
      raise Exceptions::RecordNotFound unless record
      record
    end

    def find_by(attributes)
      @model_class.find_by(attributes)
    end

    def all
      @model_class.all
    end

    def create(attributes)
      @model_class.create!(attributes)
    end

    def update(id, attributes)
      record = find(id)
      record.update!(attributes)
      record
    end

    def destroy(id)
      record = find(id)
      record.destroy!
    end
  end
end
