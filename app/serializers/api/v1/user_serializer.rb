class Api::V1::UserSerializer < ActiveModel::Serializer

  attributes :questions, :answers, :votes

  has_many :questions
  has_many :answers
  # has_many :votes

  # from question serializer
  has_many :answers
  # belongs_to :user

  # has_many :tags

  # belongs_to :category

  # from answer serializer
  # has_many :votes
  # # belongs_to :user
  # belongs_to :question

end
