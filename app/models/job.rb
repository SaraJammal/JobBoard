class Job < ApplicationRecord
  # include Elasticsearch::Model
  #
  # include Elasticsearch::Model::Callbacks
  #
  # # ElasticSearch Index
  # settings index: { number_of_shards: 1 } do
  #   mappings dynamic: 'false' do
  #     indexes :description
  #
  #   end
  # end
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :company, :class_name => 'User', :foreign_key => 'company_id'
  belongs_to :category
  has_many :job_applications, :dependent => :destroy
  has_many :applicants, :through => :job_applications, :class_name => 'User'

  JOB_TYPES = %w[Full-time Part-time Freelance]

  def self.by_category(category_id)
    where(category: category_id)
  end
end
