# == Schema Information
#
# Table name: kittens
#
#  id         :integer          not null, primary key
#  age        :integer
#  cuteness   :integer
#  name       :string
#  softness   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Kitten < ApplicationRecord
  validates :age, presence: true
  validates :cuteness, presence: true, numericality: { in: 0..5 }
  validates :name, presence: true
  validates :softness, presence: true, numericality: { in: 0..5 }
end
