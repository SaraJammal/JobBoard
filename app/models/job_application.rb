class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :applicant, :class_name => 'User', :foreign_key => 'user_id'
  has_one_attached :resume

end
