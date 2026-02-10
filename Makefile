.PHONY: commit-and-push
msg ?= $(shell date '+%Y-%m-%d %H:%M:%S')
commit-and-push:
	git add -A
	git diff --cached --quiet || git commit -m "$(msg)"
	git push

.PHONY: amend-and-push
amend-and-push:
	git add -A
	git diff --cached --quiet || git commit --amend --no-edit
	git push -f

.PHONY: codex-code-review-mode
codex-code-review-mode:
	codex --sandbox read-only --ask-for-approval never
