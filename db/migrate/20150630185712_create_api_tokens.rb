class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
      t.integer :store_id
      t.string :hex_value

      t.timestamps null: false
    end
  end
end
