class AmsPostSerializer < AmsSerializer
  attributes :title, :body

  has_many :comments, serializer: AmsCommentSerializer

  belongs_to :user, serializer: AmsUserSerializer
end
