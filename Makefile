HTMLPROOFER = bundle exec htmlproofer

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

build-production:
	hugo

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
