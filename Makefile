NVM=. $$NVM_DIR/nvm.sh && nvm
SMALL_COMMIT_HASH=$(shell git log -1 --pretty=%h)

.PHONY: help

help: ## Shows the available commands.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

nvm: ## Updates default npm and uses it
	$(NVM) install-latest-npm
	$(NVM) alias default node
	$(NVM) use default

bootstrap-nvm: ## Prepares the machine to run the application on an environment with nvm installed.
	make nvm
	brew install yarn
	make install

bootstrap: ## Prepares the machine to run the application on a clean environment.
	brew install node npm
	brew install yarn
	make install

install: ## Installs libraries and prepares the environment.
	yarn install

serve: ## Runs the application.
	yarn serve

test: ## Runs the test suite.
	yarn test

lint: ## Runs the linter.
	yarn lint

build: # Builds the production assets.
	yarn build

deploy: # Deploys the production app
	yarn deploy
