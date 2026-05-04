These are rules I want my AI agents to follow when operating in Git.

# Claude

I've symlinked `AGENTS.md` to my `~/.claude/CLAUDE.md`.

```
ln -s ~/dev/dotfiles/agent-rules/AGENTS.md ~/.claude/CLAUDE.md
```

The `skills` directory has all my Claude skills (formerly "commands").

```
ln -s ~/dev/dotfiles/agent-rules/skills/ ~/.claude/skills
```

# Cursor

Cursor [does support the agentskills.io standard](https://cursor.com/docs/context/skills). I haven't symlinked this into place yet on my workstation to try it out.

## Other resources:

* The pipelines-as-code team has several cursor instructions [here](https://github.com/openshift-pipelines/pipelines-as-code/tree/35bc4b4da7f05458ef9866d9b11f1041401ceaaa/.cursor/rules)
* More than you could ever want at https://github.com/PatrickJS/awesome-cursorrules
