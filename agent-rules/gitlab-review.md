_Note: I plan to refine this into a claude command later._


address the merge request review comments in _gitlab mr url_

Use gitlab tools to query the GitLab MR and read the review discussion comments. Take note of the branch name that has my in-progress changes.

Ask me before you push any code changes.

When writing the commit message, add a "Reported-By:" line to credit the reviewer. For example: "Reported-By: John Smith <jsmith@example.com>". To determine the user's preferred email address, look in the Git history for this repository and use that.

Draft a response to the MR comment, but do not post it. keep it very brief, 
professional, and friendly.


----
This part seemed to go a bit haywire in my testing. I think it was too complicated because the LLM grabbed some other extra commits and added them into the branch:

```
Before you edit the code: update the "main" branch to be in sync with the "origin" remote's "main", and then rebase this feature branch on top of that. This will ensure that you are editing the very latest version of the code.
```
