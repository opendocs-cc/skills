# OpenDocs.cc skill and plugins

[OpenDocs.cc](https://opendocs.cc) gives your AI agent somewhere to put its Markdown: a clean link your team can read, and a PDF or Word file in your brand. This repository holds the OpenDocs agent skill and the OpenDocs.cc plugin for Claude Code and Codex, which bundles the skill with the OpenDocs MCP server.

What your agent can do once it's installed:

- **Sign you up from the terminal** with an emailed 6-digit code. No API keys to copy.
- **Publish** a Markdown file and hand you a link. Publishing the same file again updates the same link, with version history.
- **Export** to PDF or Word with your logo, brand color and font.
- **Share** with people outside your workspace, organize documents into projects, and save to Google Drive or send for e-signature (Pro and Team).

Free for up to 50 documents. See [pricing](https://opendocs.cc/pricing).

## Install

**Claude Code** (plugin, with `/opendocs-cc:publish`, `/opendocs-cc:export` and the OpenDocs MCP server):

```text
/plugin marketplace add opendocs-cc/skills
/plugin install opendocs-cc@opendocs-cc
```

**Codex** (plugin, with the skill and the OpenDocs MCP server):

```bash
codex plugin marketplace add opendocs-cc/skills
codex plugin add opendocs-cc@opendocs-cc
```

**Any agent that reads skills** (Claude Code, Codex, Cursor, OpenClaw and others), with the [skills CLI](https://skills.sh):

```bash
npx skills add opendocs-cc/skills --skill opendocs -g -y
```

**No Node.js:** installs the skill plus a small `curl` + `jq` client:

```bash
curl -fsSL https://opendocs.cc/install.sh | bash
```

The full CLI is on npm: `npm install -g @opendocs.cc/cli` ([source](https://github.com/opendocs-cc/opendocs-cli)).

**Claude, ChatGPT and other AI apps (MCP):** add `https://mcp.opendocs.cc/mcp` as a connector and sign in with your OpenDocs account. Setup for every app: [opendocs.cc/mcp](https://opendocs.cc/mcp).

## Try it

Ask your agent:

- "Publish this plan to OpenDocs and give me the link."
- "Export the board report as a PDF."
- "Publish everything in ./docs into a project called Launch."

## What's here

| Path | What it is |
| --- | --- |
| `skills/opendocs/SKILL.md` | The skill: how an agent signs up, publishes, updates, shares and exports |
| `skills/opendocs/scripts/opendocs.sh` | A `curl` + `jq` client for machines without Node.js |
| `commands/` | The Claude Code slash commands |
| `.mcp.json` | The OpenDocs MCP server (`https://mcp.opendocs.cc/mcp`), which Claude Code connects to with your OpenDocs sign-in |
| `.claude-plugin/` | Claude Code plugin and marketplace manifests |
| `.codex-plugin/` | The Codex plugin manifest (same skill and MCP server) |
| `assets/` | Icons for plugin listings |
| `openai/` | The submission to OpenAI's plugin directory for ChatGPT and Codex: the MCP server only, with review test cases. `openai/build.sh` builds the ZIP |

The skill is synced every day from [opendocs.cc/skill.md](https://opendocs.cc/skill.md), which is published from the [CLI repository](https://github.com/opendocs-cc/opendocs-cli/blob/main/agent/SKILL.md). Send changes there.

## Data and privacy

The plugin is instructions plus the `opendocs` command-line tools and a connection to the OpenDocs MCP server; it doesn't run anything in the background. When you ask your agent to use it:

- **What's sent, and where:** the Markdown documents you publish or export, and your email address when you sign in (to receive a sign-in code), go to OpenDocs at `api.opendocs.cc` (or, through MCP, `mcp.opendocs.cc`). Nothing is sent to any other service.
- **What's stored on your machine:** an OpenDocs API key and your account and workspace details, in the CLI's config file (`~/.config/opendocs/config.json`), plus a `.opendocs/state.json` file in folders you publish from, so publishing again updates the same document.
- **What OpenDocs keeps:** your documents and their versions, until you delete them (anonymous documents are deleted after 24 hours). See the [privacy policy](https://opendocs.cc/privacy).
- **Who can see it:** documents are visible to your workspace by default. The skill asks before making anything public.

## Links

- Docs: [docs.opendocs.cc](https://docs.opendocs.cc)
- Privacy: [opendocs.cc/privacy](https://opendocs.cc/privacy) · Terms: [opendocs.cc/terms](https://opendocs.cc/terms)
- Questions: [hello@opendocs.cc](mailto:hello@opendocs.cc)

MIT licensed.
