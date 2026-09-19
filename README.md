# Altay eggs for Pterodactyl

An egg for running [Altay](https://github.com/altayofficial/Altay) on a Pterodactyl panel.

## Installing

Download `egg-altay.json` from the [latest release](https://github.com/altayofficial/Altay-Eggs/releases/latest), then in your panel go to **Admin → Nests → Import Egg** and upload it.

Create a server from the egg afterwards. The install step fetches the server and a matching PHP build; nothing else is required.

## What the egg does

Altay needs a PHP binary with extensions and threading support that a distribution PHP does not provide, so the install step pulls both the server and the right build for it. The startup command then runs that binary rather than whatever is on `PATH`.

The setup wizard is skipped, since it expects a terminal the panel cannot give it. The server writes a default `server.properties` on first boot, and the panel keeps its port in sync from there.

## Variables

| Variable | Default | Meaning |
| --- | --- | --- |
| `BUILD_TYPE` | `stable` | `stable` for the newest release, `nightly` for a build from the current `master`. Nightly builds carry no release notes and are not meant for a server people play on. |

## Ports

Bedrock runs over **UDP**. The primary allocation must be UDP, normally `19132`. A TCP allocation on the same port does nothing.

## Updating

Reinstalling the server pulls the current build for the channel in `BUILD_TYPE`. Worlds, players and plugins live in the volume and survive that.

Read the release notes before jumping versions: each release names the Minecraft version it targets, and some drop support for older clients.

## Licence

MIT. Altay itself is LGPL-3.0.
