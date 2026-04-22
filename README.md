# Build the image

```bash
docker build --build-arg UID=$(id -u) -t opencode-local .
```

# Run with sound and notifications (Hyprland/PipeWire)

```bash
./run-opencode.sh
```

# Create `opencode` alias

Add to your `~/.bashrc` or `~/.zshrc`:
```bash
alias opencode='/path/to/opencode-docker/run-opencode.sh'
```

Or create a symlink in your PATH:
```bash
sudo ln -s /path/to/opencode-docker/run-opencode.sh /usr/local/bin/opencode
```

Then just run:
```bash
opencode
```
