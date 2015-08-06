class UserPet < ActiveRecord::Base
  belongs_to :user
  # added dependent: :delete
  belongs_to :pet, dependent: :delete
end
# update or delete on table "pets" violates foreign key constraint "fk_rails_dedd5edecd" on table "user_pets