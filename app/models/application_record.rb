class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/.freeze     # アルファベット、＠、ドット 例：aaaa@aaa.com
end
