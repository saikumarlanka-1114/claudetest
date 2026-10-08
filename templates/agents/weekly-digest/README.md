# Weekly Digest Agent

Every Monday it reads the last 7 days of GitLab activity and produces a short digest: what shipped, what's stuck, pipeline health, and decisions needed.

## How it works
`run-digest.sh` runs `claude -p` (headless) with the prompt in `digest-prompt.md`. Claude may only call **read-only** `glab` commands (enforced by `--allowedTools`), so it cannot change anything. Output goes to `digest.md` and, optionally, a chat webhook.

## Try it locally first
```
glab auth login
bash templates/agents/weekly-digest/run-digest.sh
cat digest.md
```

## Schedule it
Copy `.gitlab-ci.snippet.yml` into your pipeline and add a Pipeline Schedule. Store tokens as masked CI/CD variables; never commit them.

## Make it yours (this is where it gets valuable)
- Edit the sections in `digest-prompt.md` to match what your team cares about.
- Add other sources: Jira/Azure DevOps via MCP, deploy history, support tickets.
- Compare to last week's `digest.md` artifact to show trends.
- Track impact: time saved writing status updates, number of stale MRs caught.

## Before rollout
- Confirm with your org that sending MR titles/descriptions to Claude is allowed.
- Review a few digests by hand before posting to a wide channel.
