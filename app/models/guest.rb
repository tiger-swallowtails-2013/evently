require 'active_record'


class Guest < ActiveRecord::Base
  belongs_to :event
end