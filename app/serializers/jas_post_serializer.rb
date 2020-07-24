class JasPostSerializer < JasSerializer
  attributes :title, :body

  belongs_to :user, serializer: JasUserSerializer

  has_many :comments, serializer: JasCommentSerializer
end
