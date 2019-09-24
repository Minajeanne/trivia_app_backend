class UserSerializer
  include FastJsonapi::ObjectSerializer
  attribute :username
  has_many :games, serializer: GameSerializer
  has_many :stats, serializer: StatSerializer

end
