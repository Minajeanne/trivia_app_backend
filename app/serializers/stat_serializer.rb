class StatSerializer
  include FastJsonapi::ObjectSerializer
    attributes :id, :total_correct, :user_pr, :user_rank
end
