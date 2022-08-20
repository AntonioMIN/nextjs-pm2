# Deploy Next.js using PM2

### 1. Add PM2 configuration file

```js
// ecosystem.config.js
module.exports = {
  apps: [
    {
      name: "nextjs-pm2",
      script: "node_modules/next/dist/bin/next",
      args: "start server",
      instances: "max",
      exec_mode: "cluster",
    },
  ],
};
```

### 2. Create Makefile

```makefile
# Makefile
.PHONY: deploy
deploy:
	mkdir -p server
	cp -r .next server
	cp -r public server
	# If you have .env files uncomment the following lines
	# cp .env server
	# cp .env.production server
	pm2 reload ecosystem.config.js
```

### 3. Change tsconfig.json (if using Typescript)

Add `server` to `exclude`

```json
{
  "exclude": ["node_modules", "server"]
}
```

### 4. Run script

```bash
yarn build && make deploy
```

You can add to `package.json`

```json
{
  "scripts": {
    "deploy": "yarn build && make deploy"
  }
}
```
