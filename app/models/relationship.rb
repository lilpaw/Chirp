class Relationship < ActiveRecord::Base
  belongs_to :prey, class_name: "User"
  belongs_to :stalker, class_name: "User"
end
