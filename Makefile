.PHONY: deploy
deploy:
	mkdir -p server
	cp -r .next server
	cp -r public server
	# If you have .env files uncomment the following lines
	# cp .env server
	# cp .env.production server
	pm2 reload ecosystem.config.js
