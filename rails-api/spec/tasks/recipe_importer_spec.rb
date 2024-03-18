# frozen_string_literal: true

Rails.application.load_tasks

describe 'recipe_importer.rake' do
  it 'imports recipes from file' do
    Rake::Task['recipe_importer:import_all'].invoke("#{File.dirname(__FILE__)}/../fixtures/recipes-fr.json")
    expect(Recipe.count).to eq(2)
    recipes = Recipe.order(id: :asc).all

    expect(recipes[0].name).to eq('6 ingrédients que l’on peut ajouter sur une crêpe au Nutella®')
    expect(recipes[0].people_quantity).to eq('6')
    expect(recipes[0].prep_time).to eq('15 min')
    expect(recipes[0].cook_time).to eq('10 min')
    expect(recipes[0].total_time).to eq('25 min')
    expect(recipes[0].budget).to eq('bon marché')
    expect(recipes[0].rate).to eq(5)
    expect(recipes[0].ingredients).to eq(
      [
        '600g de pâte à crêpe',
        '1/2 orange',
        '1/2 banane',
        '1/2 poire pochée',
        '1poignée de framboises',
        '75g de Nutella®',
        '1poignée de noisettes torréfiées',
        "1/2poignée d'amandes concassées",
        "1cuillère à café d'orange confites en dés",
        '2cuillères à café de noix de coco rapée',
        '1/2poignée de pistache concassées',
        "2cuillères à soupe d'amandes effilées"
      ]
    )

    expect(recipes[1].name).to eq("Agneau à l'abricot (recette turque)")
    expect(recipes[1].people_quantity).to eq('4')
    expect(recipes[1].prep_time).to eq('2 h')
    expect(recipes[1].cook_time).to eq('1 h')
    expect(recipes[1].total_time).to eq('3 h')
    expect(recipes[1].budget).to eq('Coût moyen')
    expect(recipes[1].rate).to eq(3.4)
    expect(recipes[1].ingredients).to eq(
      [
        "1kg d'agneau",
        '300g de riz',
        '24 abricots secs',
        '1cuillère à soupe de sucre en poudre',
        '50g de matière grasse (saindoux, beurre ou huile)',
        '100g de beurre',
        '75cl de bouillon',
        'Poivre',
        'Sel'
      ]
    )
  end
end
