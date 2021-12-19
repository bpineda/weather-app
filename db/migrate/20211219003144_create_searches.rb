class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :query, null: false
      t.string :zip_code, null: true
      t.text :geo_response, null: true
      t.text :weather_response, null: true
      t.timestamps
    end
  end
end
