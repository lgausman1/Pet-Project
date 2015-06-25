class ChangePetAgeToInteger < ActiveRecord::Migration

  class << self
    include AlterColumn
  end
  
  def self.up
    alter_column(:pets, :age, :integer, true)
  end
 
  def self.down
    raise ActiveRecord::IrreversibleMigration.new
  end
end