# 🚀 Packet Tracer Bypass Firewall Rule

This repository contains a `.bat` script designed to block **Cisco Packet Tracer**'s outbound traffic using a Windows firewall rule. This bypasses the Cisco Packet Tracer login requirement.

## ⚙️ Description

The script performs the following actions:

- Searches for the `PacketTracer.exe` location in `C:\Program Files\Cisco Packet Tracer*`.
- Creates an outbound firewall rule that blocks all traffic for `PacketTracer.exe`, which prevents login requirements.

## 📥 Download and Run

You can download the latest release directly from the [Releases](https://github.com/hakuryuujs/packettracerbypass/releases) page, or you can run the following command in CMD:

```cmd
curl -o bypass.bat https://raw.githubusercontent.com/hakuryuujs/packettracerbypass/refs/heads/main/bypass.bat && bypass.bat
```

> **Note:** Running this script requires Administrator privileges.

---

> 🛠 This script was developed by [ottersek](https://github.com/ottersek).
