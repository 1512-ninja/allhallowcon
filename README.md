# allhallowcon

Build automation for the Allhallowcon photo booth.

## Contents

| Path | Contents |
|---|---|
| `ansible/` | Provisions the photo booth host — [PhotoboothProject/photobooth](https://github.com/PhotoboothProject/photobooth) served by Apache, gphoto2 for the DSLR, `v4l2loopback` for live view, and a `kiosk` user auto-logged into fullscreen Chromium under Xfce |
| `3dprint/` | OpenSCAD source and exported STL/3MF for the booth's screen holder |

The inventory in `ansible/hosts` points at `192.168.1.111`. Run with:

```console
$ ansible-playbook -i ansible/hosts ansible/photobooth.yml
```

The playbook reboots the host when the desktop or kiosk configuration changes.

## What lives elsewhere

- **DNS and the `allhallowcon.com` registration** are managed in
  [1512-ninja/events](https://github.com/1512-ninja/events) (`bootstrap/`), which owns the
  hosted zone and the registrar's name servers. Nothing in this repo touches AWS.
- **Event sites** are built with
  [duplico/partyplanner](https://github.com/duplico/partyplanner) and deployed from that
  same events repo, one occasion per domain.

The photo booth has no email path. It previously mailed photos through SES; that stack is
gone, and the current event system has no delivery layer by design.

## Branches

`www` holds the Jekyll source for the 2024 GitHub Pages site. No DNS points at it.
