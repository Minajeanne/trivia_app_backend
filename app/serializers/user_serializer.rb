class UserSerializer
  include FastJsonapi::ObjectSerializer

  belongs_to :stat, serializer: StatSerializer
  attribute :username
  
end
