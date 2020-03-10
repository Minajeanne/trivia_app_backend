class StatSerializer
  include FastJsonapi::ObjectSerializer

    belongs_to :user, serializer: UserSerializer
    attributes :id, :total_correct, :user_pr, :user_rank

    attribute :username do |object|
      username = User.find_by(id: object.user_id)
      "#{username}"
    end
end
