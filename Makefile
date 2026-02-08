.PHONY: amend-all
amend-all:
	git commit --amend --no-edit --all

.PHONY: codex-code-review-mode
codex-code-review-mode:
	codex --sandbox read-only --ask-for-approval never
