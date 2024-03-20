# receipe-finder

## Introduction
This project is composed of two sub-projects:
* `rails-api`: server API giving a list of recipes from ingredients
* `nextjs-webapp` : a nextJS application calling the API and displaying results.

Check readme file in sub-folders for additional details.

## Hosting

The application is hosted on Fly.io, and can be accessed on the following URLs:
* API: https://recipes-finder-api.fly.dev/recipes
* Web App: https://recipe-finder-webapp.fly.dev

WARNING: there is currently a waiting time of several seconds the first time the API
is called after an inactivity period. The web application doesn't implement a loader
yet so the web app may appear frozen during this waiting time.

## Application code

Most of the application code can be found in the following files:
* API code: `rails-api/app/controllers/recipes_controller.rb`
* Recipes importer: `rails-api/lib/tasks/recipe_importer.rake`
* Database model: `rails-api/db/schema.rb`
* API tests: `rails-api/spec/requests/recipes_spec.rb`
* Importer tests: `rails-api/spec/tasks/recipe_importer_spec.rb`
* Web App code: `nextjs-webapp/pages/index.js`