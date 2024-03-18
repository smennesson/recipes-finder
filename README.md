# receipe-finder

## Rails API

Rails application proving an API giving a list of recipes matching given ingredients.

### Running tests locally

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

### Importing recipes to development database

Reset the development database if necessary:

```
make reset_dev_db
```

Import the recipes from the `recipes-fr.json` file:

```
RAILS_ENV=development bundle exec rake 'recipe_importer:import_all[path/to/recipes-fr.json]'
```

Note: the English JSON file isn't supported.