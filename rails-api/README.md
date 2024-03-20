# README

This Rails application provides an API giving a list of recipes matching given ingredients.

## API description

```
# Get a list of recipes ordered by rating:
GET /recipes

# Get a list of recipes matching given ingredients, ordered by rating:
GET /recipes?ingredients[]=firstIngredient&ingredients[]=secondIngredient

# Output format example:
{
  "recipes": [
    {
      "id": 1781,
      "name": "Curry d'agneau à l'indienne à ma façon",
      "people_quantity": "8",
      "prep_time": "30 min",
      "cook_time": "1 h",
      "total_time": "1h30",
      "budget": "Coût moyen",
      "rate": "5.0",
      "ingredients": [
        "1 gigot d'agneau",
        "Fruits restants dans le compotier, pommes, poires, l'équivalent de 3 fruits entiers"
      ],
      "created_at": "2024-03-19T17:02:19.093Z",
      "updated_at": "2024-03-19T17:02:19.093Z"
    },
    {
      "id": 1814,
      "name": "Curry de poulet à la noix de coco",
      "people_quantity": "4",
      "prep_time": "15 min",
      "cook_time": "1 h",
      "total_time": "1h15",
      "budget": "bon marché",
      "rate": "5.0",
      "ingredients": [
        "4 cuisses de poulet",
        "6 oignons"
      ],
      "created_at": "2024-03-19T17:02:19.383Z",
      "updated_at": "2024-03-19T17:02:19.383Z"
    }
  ]
}
```

## Running tests locally

Run the following command from the `rails-api` folder.

Start the database (requires Docker):

```
make start_docker_compose
```

Prepare the test suite if needed:

```
make prepare_tests
```

Launch the test suite:

```
make tests
```

## Importing recipes to development database

Reset the development database if necessary:

```
make reset_dev_db
```

Import the recipes from the `recipes-fr.json` file:

```
RAILS_ENV=development bundle exec rake 'recipe_importer:import_all[path/to/recipes-fr.json]'
```

Note: the English JSON file isn't supported.

## Running the server in local

Start the database (requires Docker):

```
make start_docker_compose
```

Start the server:
```
bundle exec rails s
```