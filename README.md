Build command:
```bash
docker build --build-arg UID=$(id -u) -t opencode-local .
```

Run command:
```bash
docker run \
  -it \
  --rm \
  --name opencode-$(basename "$PWD") \
  --security-opt=no-new-privileges \
  -v ~/.config/opencode:/home/user/.config/opencode:ro \
  -v ~/.local/share/opencode:/home/user/.local/share/opencode \
  -v ~/.serena/contexts/opencode.yml:/home/user/.serena/contexts/opencode.yml:ro \
  -v $(pwd):/home/user/$(basename "$PWD") \
  opencode-local \
  /home/user/$(basename "$PWD")
```

Create alias:
```bash
alias opencode='docker run -it --rm --name opencode-$(basename "$PWD") --security-opt=no-new-privileges -v ~/.config/opencode:/home/user/.config/opencode:ro -v ~/.local/share/opencode:/home/user/.local/share/opencode -v ~/.serena/contexts/opencode.yml:/home/user/.serena/contexts/opencode.yml:ro -v $(pwd):/home/user/$(basename "$PWD") opencode-local /home/user/$(basename "$PWD")'
```
