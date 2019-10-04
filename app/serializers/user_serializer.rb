class UserSerializer
  include FastJsonapi::ObjectSerializer
  attribute :username
  has_many :games, serializer: GameSerializer
  belongs_to :stat, serializer: StatSerializer

end
