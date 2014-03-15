class Ayurveda < ActiveRecord::Base
  has_many :users
  validate :name, presnece: true
end
