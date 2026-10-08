# Claude Knowledge

Reusable Claude Code setup notes and templates (C# / .NET, GitLab). Generic on purpose: no company or project names, no secrets.

## 1. Install (one time)
- Install Node.js LTS and the .NET SDK (Claude runs `dotnet build` / `dotnet test`).
- `npm install -g @anthropic-ai/claude-code`
- Run `claude` and log in with your work account.

## 2. Start in a repo
```
cd <your-repo>
claude
```
Run `/init` to generate `CLAUDE.md`, then merge in `templates/CLAUDE.md`.

## 3. Connect GitLab
- `winget install glab`, then `glab auth login`
- Use a personal access token with the `api` scope (GitLab → Preferences → Access Tokens). Never commit it.
- Then ask Claude to summarize MRs, explain failed pipelines, open MRs.

## 4. IDE
VS Code has a Claude Code extension. For Visual Studio / Rider, run `claude` in the terminal alongside.

## 5. Day-one prompts
- "Explain the architecture of this solution and where X lives."
- "Find every caller of `<Method>` and what breaks if I change its signature."
- "Write xUnit tests for `<Class>` and run them."
- "Review my current diff for bugs" (`/code-review`)
- "Fix the failing test, then explain the root cause."

## 6. Habits
- Shift+Tab for plan mode on bigger changes; approve the plan first.
- Small tasks, commit often, `/clear` between unrelated tasks.
- After a day of use, run `/fewer-permission-prompts`.
- Save repeated workflows as commands in `.claude/commands/` (see `templates/commands/`).

## 7. Check with your org
- Data policy: is sending code to Claude allowed?
- Proxy/firewall must allow npm and the Claude API.
