# Hello API
This is an improved version of the current hello-api we use in production. It will use less memory and be cheaper to run in production, and it will scale, expand to additional words, and be more stable.

## Dependencies
- Go version 1.25.0

## Setup
> Development expects to run in a Unix-like system. If you are running Windows, please consider following these directions (https://documentation.ubuntu.com/wsl/stable/#1-overview).

### Install GO
```bash
sudo make setup
```

### Upgrade GO
```bash
sudo make install-go
```

## Release Milestones

### V0 (1 Day)
- [ ] Onboarding documentation
- [ ] Simple API response (Hello World!)
- [ ] Unit tests
- [ ] Running somewhere other than dev machine

### V1 (7 Days)
- [ ] Create translation endpoint
- [ ] Store translations in short-term storage
- [ ] Call existing service for translation
- [ ] Move toward long-term storage
