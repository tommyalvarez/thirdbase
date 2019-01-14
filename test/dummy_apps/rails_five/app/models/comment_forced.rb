class CommentForced < ApplicationRecord
  self.table_name = 'comments'
  belongs_to :user
end

CommentForced.extend ThirdBase::Forced
