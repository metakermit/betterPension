web: bundle exec puma -C config/puma.rb
worker: env QUEUE=better_pension QUIET=1 bundle exec rake jobs:work
release: rubocop -Fl -fo --fail-level E
