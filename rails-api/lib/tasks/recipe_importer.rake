# frozen_string_literal: true

namespace :recipe_importer do
  desc 'Import recipes from JSON file'
  task :import_all, [:filepath] => [:environment] do |_task, args|
    recipes_count = File.foreach(args[:filepath]).inject(0) { |c, _line| c + 1 }
    bar = ProgressBar.new(recipes_count)
    File.readlines(args[:filepath], chomp: true).each do |line|
      recipe_data = JSON.parse(line, symbolize_names: true)
      Recipe.create!(
        name: recipe_data[:name],
        people_quantity: recipe_data[:people_quantity],
        prep_time: recipe_data[:prep_time],
        cook_time: recipe_data[:cook_time],
        total_time: recipe_data[:total_time],
        budget: recipe_data[:budget],
        rate: recipe_data[:rate],
        ingredients: recipe_data[:ingredients]
      )
      bar.increment!
    end
  end
end
