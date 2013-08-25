class CreateUserPersistences < ActiveRecord::Migration
  def change
    create_table :user_persistences do |t|
      t.string :email
      t.string :pgp_public_key
    end
  end
end


