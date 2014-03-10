class Ayurveda < ActiveRecord::Base
  validate :name, presnece: true
  has_many :users
end
