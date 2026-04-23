# AI Augmented Workflow

This is how I currently use AI coding agents in day-to-day software development. It is not a
universal recipe or final workflow; it is the process I came to after several months of heavy AI
coding use.

## Persistent AI Context

I keep persistent Codex instructions in the user-level file. By default, Codex reads
`~/.codex/AGENTS.md`, unless `CODEX_HOME` points somewhere else. I prefer to keep this file in
version control and symlink it on each machine.

I use it for durable rules that should apply across projects: style preferences, security
constraints, review expectations, naming conventions, and workflow habits. I also put a magic
number there and ask Codex to report it, so I can quickly verify that the expected instruction file
was loaded.

## Task Workflow

When the task is clear, I write the prompt like a short task specification for another developer:
desired behavior, important fields, constraints, and implementation details that matter. I do not
try to make the English perfect or cover every small gap.

I use Codex with GPT-5.4 when available and let it inspect the repository so the implementation
fits the existing structure. When I need to add more context, I often dictate it, transcribe it,
and paste the raw text after the concise task description.

## First Implementation Pass

I treat the first Codex result as a draft. At this stage I often tell it not to create tests and
not to create Django migrations. The code usually needs refactoring, so early tests and migrations
often become extra work to review, rewrite, or regenerate.

After the first draft, I commit it and open a draft pull request. The PR gives me a better review
surface than reading scattered working-tree changes.

## Research Workflow

When the task or architecture is unclear, I research first. For completely new topics, I use
ChatGPT to understand concepts and options. For project-specific uncertainty, I research directly
in Codex because it has the codebase context. After that, I turn the chosen approach into a
concrete Codex task.

## Refactoring Workflow

I review the draft file by file and usually refactor it in one of three ways.

Most often, I describe the change in plain English and ask Codex to do it: merge functions,
remove a parameter, simplify logic, rename something, or move code. If the explanation is long, I
dictate it and paste the transcription.

Often, I start the refactoring myself to show the direction, then ask Codex to finish it. Least
often, I refactor fully by hand, usually when the logic is easier to express in code than in
English.

## Verification Workflow

After refactoring, I create migrations and run them. In Django projects I may create migrations
earlier because tooling requires them before commit, but I recreate them near the end because the
schema can change during refactoring.

Then I test manually. I do not skip this even for API-only work. Unit tests often miss real
end-to-end behavior, and finding problems locally is cheaper than finding them after deployment or
after migrations touched an environment. I usually cover the happy path and any simple negative
paths that are easy to check.

After manual testing, I ask Codex to write tests. I review the test code, point out gaps, ask
Codex to improve it, and make sure the new tests pass. I often do this in parallel with review:
Codex changes something while I continue inspecting another part of the diff.

Finally, I ask Codex to run the full test suite step by step and fix simple issues. I also tell
it to stop and report if it suspects a real bug or a non-obvious test update. In that case, I
decide whether the implementation is wrong, the old test should change, or the old test no longer
makes sense.

## Human Responsibility

AI can produce the implementation, but I still own the result. I review the generated changes,
remove unnecessary complexity, align the code with local practices, and verify behavior before
publishing.

See also:
- [Use AI for Coding as Much as Possible](../general-principles/use-ai.md)
- [Review and Refactor AI-Generated Code](../general-principles/review-and-refactor-ai-code.md)

[Back](../README.md)
