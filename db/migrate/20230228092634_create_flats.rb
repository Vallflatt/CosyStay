class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :title
      t.text :description
      t.string :street
      t.string :city
      t.string :country
      t.string :image_url
      t.integer :price

      t.timestamps
    end
  end
end
