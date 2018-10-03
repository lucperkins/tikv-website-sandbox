develop:
	hugo server \
		--buildDrafts \
		--buildFuture \
		--disableFastRender \
		--ignoreCache

build-production:
	hugo

build-preview:
	hugo \
		--buildDrafts \
		--buildFuture \
		--baseURL $(DEPLOY_PRIME_URL)
