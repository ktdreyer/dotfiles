Always make Git commits on a feature branch instead of committing directly to "main".

Write commit messages that say "why", rather than "what".

Do not give a detailed list of changes that simply matches the git diff.

Use the active voice, imperative mood, and present tense.

Do not include "Fixes #" in commit messages. Only include that "Fixes #" information in GitHub PR descriptions.

Keep the first line under 60 characters for good Git log readability.

When writing Git commits:
- use simple plaintext
- Do not use Markdown in Git commit text itself.

Conversely, when writing GitHub PR description text or GitLab Merge Request description text:
- Use Markdown for pre-formatting text like variable names (example: `BASE_REQUIREMENTS`) or filenames (example: `constraints.txt`), or syntax highlighting where appropriate.

Git commit logs should be simple to read in a terminal, whereas GitHub or GitLab should be pleasantly-formatted to read in a browser.
