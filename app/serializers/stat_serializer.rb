class StatSerializer
  include FastJsonapi::ObjectSerializer

    belongs_to :user, serializer: UserSerializer
    attributes :id, :total_correct
end
