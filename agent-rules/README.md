These are rules I want my AI agents to follow when operating in Git.

# Claude

I have split up my prompts into a few different Markdown files so I can organize them more easily. For now I care the most about commits.md so I've symlinked that one to `~/.claude/CLAUDE.md`.

```
ln -s ~/dev/dotfiles/agent-rules/commits.md ~/.claude/CLAUDE.md
```

In the future, perhaps I will just write a single CLAUDE.md file here in Git
instead of splitting them up like this.

The `commands` directory has all my Claude commands.

```
ln -s ~/dev/dotfiles/agent-rules/commands/ ~/.claude/commands
```

# Cursor

Cursor does not yet support storing these in Git: https://forum.cursor.com/t/global-cursor-rules-directory/50049 . it stores them in a sqlite db.

Regarding controlling commit messages, see:
* https://docs.cursor.com/en/integrations/git
* https://forum.cursor.com/t/rules-not-being-followed-in-git-commit-message-generation/31093/25

## Other resources:

* The pipelines-as-code team has several cursor instructions [here](https://github.com/openshift-pipelines/pipelines-as-code/tree/35bc4b4da7f05458ef9866d9b11f1041401ceaaa/.cursor/rules)
* More than you could ever want at https://github.com/PatrickJS/awesome-cursorrules
