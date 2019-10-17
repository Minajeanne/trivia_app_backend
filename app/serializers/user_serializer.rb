class UserSerializer
  include FastJsonapi::ObjectSerializer

  # has_many :games, serializer: GameSerializer
  belongs_to :stat, serializer: StatSerializer

  attribute :username
end
