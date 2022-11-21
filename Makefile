run_lint:
	rubocop -a

run_test:
	bundle exec bin/rails test:all