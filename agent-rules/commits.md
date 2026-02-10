Always make Git commits on a feature branch instead of committing directly to "main".

Write commit messages that say "why", rather than "what".

Do not give a detailed list of changes that simply matches the git diff.

Use the active voice, imperative mood, and present tense.

Do not include "Fixes #" in commit messages. Only include that "Fixes #" information in GitHub PR descriptions.

Keep the first line under 60 characters for good Git log readability. Start the first line of the commit message with a lower-case letter if it is not a proper noun.

When writing Git commits:
- use simple plaintext
- Do not use Markdown in Git commit text itself.

Conversely, when writing GitHub PR description text or GitLab Merge Request description text:
- Use Markdown for pre-formatting text like variable names (example: `BASE_REQUIREMENTS`) or filenames (example: `constraints.txt`), or syntax highlighting where appropriate.

Git commit logs should be simple to read in a terminal, whereas GitHub or GitLab should be pleasantly-formatted to read in a browser.

Good commit messages often require investigation, not just description. Don't just default to summarizing what obvious facts you passively observe in the files' diff. Dig into the history to find concrete facts to explain the reasoning for the change.

Frame the message body positively. Explain what users or developers gain, not just what problems are avoided. Start with brief context about the approach or technology, then describe concrete benefits.

Use quotes around commands or technical terms in the body (example: "uv tool install" instead of uv tool install).
