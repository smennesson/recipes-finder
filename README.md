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
