class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :gravatar_url, :admin, :created_at, :updated_at
  attributes :mailto_url

  def mailto_url
    "mailto:#{ object.email }"
  end
end
