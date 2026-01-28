# Copilot Instructions for devcontainers-practice

## Project Overview
This is a **Dev Containers practice project** — a learning environment for containerized development workflows. The application is a minimal Express.js server running on port 3000, designed to demonstrate Dev Container setup and usage patterns.

**Key Tech Stack:**
- Runtime: Node.js 22.20 (see `.devcontainer/Dockerfile`)
- Framework: Express.js 5.1.0 for HTTP server
- Dev Tools: nodemon for hot-reloading during development
- Containerization: Docker + VS Code Dev Containers extension

## Architecture & Data Flow

The project follows a **simple monolithic structure**:
- **Entry Point**: [src/index.js](../src/index.js) — Express server initialization
  - Single GET route at `/` returning "Hello, Express!"
  - Listens on port 3000 (forwarded in container)
- **Container Definition**: [.devcontainer/](../.devcontainer)
  - `devcontainer.json`: Declares workspace mount at `/workspace`, volume mount for `node_modules` isolation, port forwarding (3000), and auto-start command
  - `Dockerfile`: Minimal Node.js 22.20 image with npm dependencies pre-installed

## Critical Developer Workflows

### Starting Development
1. Open the project folder in VS Code
2. Install the **DevContainers** extension (already recommended in `.vscode/extensions.json`)
3. Click the remote indicator (left bottom corner) → "Reopen in Container"
4. VS Code rebuilds the Docker image and starts the container
5. `npm run dev` executes automatically (via `postStartCommand` in devcontainer.json)

**Common Issues:**
- Port 3000 conflicts: The container forwards this port; ensure nothing on the host uses port 3000
- Volume mount persistence: The `node_modules` volume mount prevents host/container sync issues — **never delete node_modules from the host while container is running**

### Running Commands
- **Development**: `npm run dev` (already auto-started)
- **Manual install**: `npm ci` (preferred over `npm install` in containers for reproducibility)
- **Testing**: No test script defined; would use `npm test` once added

## Project-Specific Patterns & Conventions

### Dev Container Patterns
- **Mount Strategy**: Workspace is bind-mounted (synced), while `node_modules` uses a Docker volume. This isolates container dependencies from the host filesystem.
- **Image Build Context**: Dockerfile context is set to `..` (project root), allowing `COPY package*.json` to pull dependencies files.
- **Port Forwarding**: Port 3000 is automatically forwarded; the server is immediately accessible at `http://localhost:3000` from the host browser.

### Node.js Conventions
- Entry file: `src/index.js` (not index.js in root)
- Dependencies locked with `package-lock.json`; uses `npm ci` in Dockerfile for deterministic installs
- No bundler or build step configured (plain CommonJS via `require()`)

## Key Files to Know

| File | Purpose |
|------|---------|
| [package.json](../package.json) | npm scripts and dependencies |
| [.devcontainer/devcontainer.json](../.devcontainer/devcontainer.json) | Dev Container lifecycle and port forwarding |
| [.devcontainer/Dockerfile](../.devcontainer/Dockerfile) | Docker image definition |
| [src/index.js](../src/index.js) | Express server entry point |
| [README.md](../README.md) | Setup instructions (Japanese) |

## Integration Points & External Dependencies

- **Docker**: Required for container execution; must be installed and running
- **VS Code DevContainers Extension**: Essential for the container workflow
- **npm Registry**: Dependencies (`express`, `nodemon`) fetched during container build
- **Port 3000**: Must be available on the host for the forwarded port to work

## Pull Request Review Guidelines

> **Note**: Please conduct reviews in Japanese (日本語でレビューを実施してください)

When reviewing PRs for this project, focus on:

### Dev Container Changes
- **devcontainer.json updates**: Verify mount paths are correct, port conflicts are avoided, and `postStartCommand` remains valid
- **Dockerfile changes**: Ensure `npm ci` is used (not `npm install`), and the build context in devcontainer.json matches the Dockerfile path expectations
- **package.json updates**: If dependencies are added, confirm the container rebuild will succeed by checking for compatibility with Node.js 22.20

### Code Changes
- **Express routes**: Keep responses simple and focused; avoid adding complex business logic at this stage (it's a practice project)
- **Entry point modifications**: Changes to `src/index.js` should maintain the simple server structure and port 3000 binding
- **New files/directories**: Should follow the `src/` organizational pattern if adding application code

### Testing & Validation
- Container builds successfully with `Rebuild Container` in VS Code
- `npm run dev` starts the server without errors in the container
- Port 3000 is accessible from the host browser after startup
- Volume mounts persist changes correctly (code edits sync, node_modules isolation holds)

---

**When making changes:**
- Keep Express routes simple and focused (the `/` route is a minimal example)
- Update `package.json` scripts if adding new workflows (build, test, lint)
- Rebuild the container if Dockerfile or `package.json` changes (`Rebuild Container` in VS Code)
- Test port forwarding after any devcontainer.json changes
