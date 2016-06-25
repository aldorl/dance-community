class Profile < ActiveRecord::Base
    belongs_to :member, dependent: :destroy

    validates :firstname, presence: true
    validates :lastname, presence: true
end
