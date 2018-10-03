HTMLPROOFER = bundle exec htmlproofer
A11YM       = node_modules/.bin/a11ym

clean:
	rm -rf public

develop:
	hugo server \
		--buildDrafts \
		--buildFuture \
		--disableFastRender \
		--ignoreCache

build-local:
	hugo --baseURL "/"

build:
	hugo

build-production: accessibility build

build-preview:
	hugo \
		--buildDrafts \
		--buildFuture \
		--baseURL $(DEPLOY_PRIME_URL)

htmlproofer-setup:
	gem install bundler \
        --no-rdoc \
        --no-ri \

	bundle install \
		--path vendor/bundle

htmlproofer: clean build-local
	$(HTMLPROOFER) public \
		--allow-hash-href \
		--http-status-ignore 403

accessibility: clean build-local
	$(A11YM) \
		--output-directory public/accessibility \
		https://tikv-website-sandbox.netlify.com
