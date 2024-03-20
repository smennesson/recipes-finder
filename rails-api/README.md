# README

This Rails application provides an API giving a list of recipes matching given ingredients.

## API description

```
# Get a list of recipes ordered by rating:
GET /recipes

# Get a list of recipes matching given ingredients, ordered by rating:
GET /recipes?ingredients[]=firstIngredient&ingredients[]=secondIngredient
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