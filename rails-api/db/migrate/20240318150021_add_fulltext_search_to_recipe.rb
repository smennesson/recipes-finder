# frozen_string_literal: true

class AddFulltextSearchToRecipe < ActiveRecord::Migration[7.1]
  def up
    execute(%q(
      ALTER TABLE recipes
      ADD COLUMN IF NOT EXISTS ingredients_tsvector tsvector generated always as(
       json_to_tsvector('french', ingredients, '["string"]')
       ) stored
    ))
  end

  def down
    remove_column :recipes, :ingredients_tsvector, if_exists: true
  end
end
