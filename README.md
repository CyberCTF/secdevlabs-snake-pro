# secDevLabs Snake Pro

[secDevLabs](https://github.com/globocom/secDevLabs)' [`owasp-top10-2021-apps/a2/snake-pro`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a2/snake-pro) app, by Globo.com and the
secDevLabs contributors: a Go (Echo) snake game backed by MongoDB with a Cryptographic Failure: passwords travel over plain HTTP and are stored in clear text. This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, built from
the vendored app folder (see [UPSTREAM.md](UPSTREAM.md)).

| Machine | Service |
| --- | --- |
| api | Snake Pro on port 10003 |
| mongodb | MongoDB 4.0.3 on port 27017 |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:10003/ and register a player. MongoDB answers on localhost:27017. The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: the app's
[README](https://github.com/globocom/secDevLabs/blob/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a2/snake-pro/README.md), with the attack narrative and the secDevLabs walkthrough.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as secDevLabs ([LICENSE](LICENSE)). The third-party software inside the images keeps
its own licence. This application is deliberately vulnerable: keep it isolated.
