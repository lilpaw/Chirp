class Tweet < ActiveRecord::Base
  #add validations
  belongs_to :user
end
