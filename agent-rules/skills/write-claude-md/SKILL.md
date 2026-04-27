---
name: write-claude-md
description: Audit existing Claude config, research the repo via code and Jira, and produce a plan for writing or updating CLAUDE.md
tools: [Bash, Read, Grep, Glob, Agent]
user-invocable: true
---

# Write or Improve CLAUDE.md

Produce a plan for writing or updating a project's CLAUDE.md file. The goal is
durable, structural knowledge that benefits every Claude interaction — not just
code reviews or one-off tasks.

## Principles

- **Audit before you create.** Check what already exists in `.claude/` (skills,
  settings, hooks) and in CLAUDE.md. Fix staleness in existing config before
  proposing new content. Small wins build trust and ease review.
- **Verify every claim.** Never assert that a file, function, version, or
  convention exists without checking. If a skill names a file, confirm it's
  still there. If git history suggests a version is "current," confirm nothing
  contradicts that.
- **Separate durable from volatile.** CLAUDE.md should contain structural
  knowledge that changes slowly: directory layout, naming conventions, key
  dependencies, integration patterns, non-obvious gotchas. Volatile state
  (active sprint goals, who's working on what, which versions are EOL) belongs
  in memory files, not CLAUDE.md.
- **Don't duplicate what the code already says.** Architecture, file paths, and
  conventions that a reader can derive by exploring the repo don't need to be
  in CLAUDE.md. Focus on the non-obvious: why things are the way they are,
  what breaks if you violate a convention, cross-repo coordination points.
- **Issue tracker context is essential.** Commit messages say what changed; Jira
  tickets say why, what went wrong, and what the team learned. Always enrich
  your understanding with issue tracker data.

## Process

### Phase 1: Audit existing Claude config

1. Check for `CLAUDE.md` in the repo root.
2. Explore `.claude/` directory: skills, settings, hooks, any other config.
3. If skills exist, compare their content against the actual repo state.
   Find stale references: renamed files, removed directories, outdated
   lists of variants/components/versions.
4. **Present findings to the user.** List what exists, what's stale, and
   what's missing. Wait for feedback before proceeding.

This is a checkpoint. Do not proceed to Phase 2 until the user confirms.

### Phase 2: Research

Run these tracks in parallel where possible:

**Track A — Repo structure:**
- Directory tree (2-3 levels deep)
- Tech stack: languages, build systems, CI config, container tooling
- Existing documentation: README, CONTRIBUTING, docs/

**Track B — Git history (last 6 months):**
- All commits: `git log --since='6 months ago' --oneline`
- Most-changed files: identify active vs. stable areas
- Commit message conventions: prefixes, ticket references, merge patterns
- Contributors: who's most active
- Extract issue tracker ticket IDs from commit messages

**Track C — Issue tracker enrichment:**
- Fetch all extracted ticket IDs using `acli jira workitem search` with JQL
- Read descriptions for every ticket
- Identify patterns: recurring problem types, architectural decisions,
  gotchas, lessons learned, cross-repo dependencies
- Produce an executive summary of the top findings (aim for 5-10 insights)

### Phase 3: Plan

Synthesize all findings into a plan/todo markdown file. The file should contain:

1. **Audit results** — what's stale in existing `.claude/` config and how to fix it
   (these are small, low-risk changes that should be committed first)
2. **Proposed CLAUDE.md sections** — outline each section with bullet points of
   what it should contain, drawn from the research
3. **Issue tracker findings** — the executive summary of patterns and gotchas,
   so the user can decide which ones belong in CLAUDE.md
4. **Skill refactoring** — if existing skills contain general repo knowledge
   that should move to CLAUDE.md, list what to move and what to keep

The plan should NOT write the actual CLAUDE.md. It provides the blueprint for
a follow-up session that does the writing.

## What belongs in CLAUDE.md

Good CLAUDE.md sections (not all repos need all of these):

- Project overview: what this repo is, who maintains it, where it's hosted
- Directory structure: what lives where
- Key conventions: naming, formatting, patterns that aren't obvious from code
- Dependencies and integration points: external tools, sibling repos,
  upstream projects that cause breaking changes
- Common gotchas: lessons from the issue tracker that a new contributor
  (human or AI) would not discover from reading code alone
- Secret/credential patterns: how secrets are referenced (not the values)
- Resolver/reference patterns: standard formats for cross-repo references

## What does NOT belong in CLAUDE.md

- Code patterns derivable by reading the codebase
- Git history or recent changes (use `git log`)
- Version lifecycle (which versions are EOL) — this changes and becomes stale
- Sprint goals or in-progress work
- Anything already in a CLAUDE.md `memory/` file
