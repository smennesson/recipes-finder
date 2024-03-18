.PHONY: reset_dev_db
reset_dev_db:
	RAILS_ENV=development bundler exec rake db:drop db:create db:schema:load db:migrate

.PHONY: prepare_tests
prepare_tests:
	RAILS_ENV=test bundler exec rake db:environment:set
	RAILS_ENV=test bundler exec rake db:schema:load db:migrate

.PHONY: tests
tests:
	bundler exec rspec

.PHONY: start_docker_compose
start_docker_compose:
	cd spec && docker-compose up
