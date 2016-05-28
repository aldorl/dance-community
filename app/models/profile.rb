class Profile < ActiveRecord::Base
    belongs_to :member

    validates :firstname, presence: true
    validates :lastname, presence: true
end
