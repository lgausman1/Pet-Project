class UserPet < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet
end
# update or delete on table "pets" violates foreign key constraint "fk_rails_dedd5edecd" on table "user_pets