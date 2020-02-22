class CreateShortUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :short_urls do |t|
      t.string :slug, null: false
      t.string :destination, null: false

      t.timestamps
    end

    add_index :short_urls, :slug, unique: true
    add_index :short_urls, :destination, unique: true
  end
end
