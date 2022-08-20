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
