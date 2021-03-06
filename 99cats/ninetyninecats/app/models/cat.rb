# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  COLORS = ['black', 'white', 'orange']

  validates :color, inclusion: COLORS
  validates :sex, inclusion: ['M', 'F']

  def age
    time_ago_in_words(self.birth_date)
  end
end
