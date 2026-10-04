# Fly System

Admin fly system for FiveM with ESX Legacy

## Features

- Toggle flight mode with a command or keybind
- Configurable cooldown between toggles
- Permission-based access control
- Customizable notifications

## Requirements

- FiveM server
- ESX Legacy framework

## Installation

1. Download the script files
2. Place them in your server's `resources` folder
3. Add `start fly_system` to your server.cfg

## Usage

### Commands

| Command | Description |
|---------|-------------|
| /fly    | Toggle flight mode |

### Permissions

- `admin.fly` - Required to use the fly command

## Configuration

Edit the `config.lua` file to customize:

- `Config.FlyCommand` - Change the command to toggle flight mode
- `Config.FlyCooldown` - Set the cooldown between toggles (in seconds)
- `Config.EnableNotifications` - Toggle notifications on/off
- `Config.NotificationDuration` - Set notification display time (in seconds)

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=fly-system&utm_content=bottom) — describe it in one sentence and get the full source code.