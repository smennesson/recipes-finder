.PHONY: tests
tests:
	bundler exec rake db:environment:set RAILS_ENV=test
	bundler exec rake db:schema:load db:migrate RAILS_ENV=test
	bundler exec rspec

.PHONY: start_docker_compose
start_docker_compose:
	cd spec && docker-compose up
