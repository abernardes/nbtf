class CreateFeedForm
  include Virtus.model

  attribute :url, URI
end
