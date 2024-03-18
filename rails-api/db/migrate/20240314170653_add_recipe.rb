class AddRecipe < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :people_quantity, limit: 15
      t.string :prep_time, limit: 15
      t.string :cook_time, limit: 15
      t.string :total_time, limit: 15
      t.string :budget, limit: 15
      t.decimal :rate
      t.json :ingredients

      t.timestamps
    end
  end
end
