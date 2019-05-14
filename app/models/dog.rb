class Dog < ActiveRecord::Base
validates :name, presence: true, length: {minimum: 3, maximum: 50 }
validates :motto, presence: true, length: {minimum: 3, maximum: 300 }
end
