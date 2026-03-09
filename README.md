# codex-copilot-auth

Multi-account auth switcher for [Codex CLI](https://github.com/openai/codex) and [GitHub Copilot](https://github.com/anomalyco/opencode) (via opencode).

Lets you store multiple accounts and switch between them instantly — useful when you hit rate limits and need to rotate to another account.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/sopenlaz0/codex-copilot-auth/main/install.sh | bash
```

## Tools

### `codex-auth` — Codex CLI account switcher

Manages multiple accounts for the [Codex CLI](https://github.com/openai/codex). Each account is stored as a JSON file in `~/.codex/accounts/`.

```bash
codex-auth list              # list all accounts
codex-auth current           # show active account
codex-auth use <account>     # switch to an account
codex-auth save <account>    # save current login as a named account
codex-auth login             # re-symlink current account
```

**Setup:** Log in with `codex auth login` for each account, then save them:

```bash
# Log in with account 1:
codex auth login

# Save it as a named account:
codex-auth save personal

# Log in with account 2:
codex auth login

# Save it:
codex-auth save sivhour

# Switch accounts:
codex-auth use personal
codex-auth use sivhour
```

---

### `copilot-auth` — GitHub Copilot account switcher (opencode)

Manages multiple GitHub Copilot accounts for [opencode](https://github.com/anomalyco/opencode). Each account is stored as a JSON file in `~/.local/share/opencode/copilot-accounts/`.

```bash
copilot-auth list              # list all accounts
copilot-auth current           # show active account
copilot-auth use <account>     # switch to an account
copilot-auth add <account>     # save current opencode copilot login as a named account
copilot-auth token <account>   # show stored token for an account
```

**Setup:**

```bash
# Log in with your first GitHub account via opencode:
opencode auth login

# Save it as a named account:
copilot-auth add personal

# Log in with a second account:
opencode auth login

# Save it:
copilot-auth add work

# Switch between them:
copilot-auth use personal
copilot-auth use work
```

> **Note:** `copilot-auth` only swaps the `github-copilot` key in opencode's `auth.json` — all other providers (Anthropic, OpenAI, etc.) are left untouched.

## Why

opencode (and Codex CLI) currently only support one OAuth account per provider. Until [multi-account support](https://github.com/anomalyco/opencode/issues/11830) lands natively, these scripts let you rotate accounts manually.

## Requirements

- `bash`
- `python3` (for `copilot-auth` JSON manipulation)
- `opencode` (for `copilot-auth`)
- `codex` CLI (for `codex-auth`)
