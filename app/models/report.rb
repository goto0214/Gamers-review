class Report < ApplicationRecord

  belongs_to :user
  belongs_to :review

  validates :report_text, presence: true

end
