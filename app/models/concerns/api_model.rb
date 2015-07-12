# Concern for Api-backed models.
module ApiModel
  extend ActiveSupport::Concern

  included do
    include Her::Model

    def errors?
      errors.present? or response_errors.present?
    end
  end
end
