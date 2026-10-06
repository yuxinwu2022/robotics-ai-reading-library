# Magazine update automation

## Saved task

- **Windows Task Scheduler name:** Robotics AI - Biweekly Magazine Update
- **Cadence:** every two weeks on Monday, 09:00 America/Chicago.
- **First scheduled run:** 2026-10-19; the 2026-10-05 edition was prepared immediately.
- **Publication:** direct commits to this repository's main branch, authorized by the user.
- **Maximum:** four magazine articles per edition, enforced against articles.json and note files.
- **Runner:** run-magazine-update.ps1; research instructions: magazine-update-prompt.md.
- **State and logs on this PC:** %LOCALAPPDATA%\RoboticsAiMagazineAutomation.
- **Git checkout:** an independent clone inside the state directory, preserving your normal workspace.
- **Task runs only while this Windows user is logged on.** Internet access and existing Codex / GitHub Desktop sign-ins are needed; the Codex desktop app itself need not remain open.
- **Missed start:** run later when possible. The runner creates at most one edition for the current two-week schedule slot.

Native Codex scheduling controls were not available in the chat, so this uses Windows Task Scheduler and Codex CLI non-interactive mode. It will not appear in the Codex app's Automations list. The CLI uses your existing configuration and saved authentication. [Official documentation for non-interactive scheduled jobs](https://developers.openai.com/codex/noninteractive).

## What a run does

1. Fetch and fast-forward its own clean checkout.
2. Check whether the current two-week edition already exists.
3. Use live search to read, select, and summarize recent magazine articles.
4. Validate dates, unique URLs, required note content, scope, and the four-article limit.
5. Commit and push the magazine files.
6. Write a success or failure record in the local log.

Previously committed editions are not rewritten. If generated changes are invalid or unfinished, they are left for inspection and the run fails rather than publishing them. A prior committed update whose push failed can be retried. No force pushes, file deletion, email, or messaging are part of the workflow.

## Manage or troubleshoot

Open Windows Task Scheduler and find the task by its name to run, disable, or inspect it. A successful task has Last Run Result 0. Logs distinguish a published edition from a check that found no edition due.

The config.json file in the local state directory stores paths and repository metadata, never tokens. GitHub authentication reads the specific signed-in GitHub Desktop account from Windows Credential Manager and passes authentication only to the Git operation; it is cleared before Codex runs.

The repository contains reviewable copies of the runner. Task Scheduler uses copies in the local state directory. Changing the repository scripts alone does not alter the installed task.

## Validation performed at setup

The first edition's original pages and publisher dates were checked. Script syntax, manifest validation, Git synchronization/publication, and scheduled process startup are checked during setup. A check of an already-current edition does not exercise future AI generation end to end.
