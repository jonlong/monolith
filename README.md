# Monolith

Evented, job-scheduling robot. Powered by Hubot.

##Hubot Core Mods
- Events added per https://github.com/nesQuick/hubot/tree/events
- Static file serving in `/public`
- Option to include custom scripts directories per https://github.com/cjbottaro/hubot/commit/d2a44bb6c3892f3828e4b60faf500f5f37921994

##Development
- Credentials and tokens/keys are stored in environment variables
- Monolith configuration is stored in `config.js`
- New scripts go in the `/scripts/custom` directory
- Scripts should expose their APIs via events on the `robot` object.
- Data is currently stored as JSON inside `/data`

##Run
```bash
bin/monolith --scripts scripts/custom
```