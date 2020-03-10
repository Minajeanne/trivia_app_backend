class StatSerializer
  include FastJsonapi::ObjectSerializer

    belongs_to :user, serializer: UserSerializer
    attributes :id, :total_correct, :user_pr, :user_rank
end
