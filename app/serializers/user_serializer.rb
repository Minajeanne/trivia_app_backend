class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username
  has_many :games, serializer: GameSerializer
  has_many :stats, serializer: StatSerializer

end
