# AI Augmented Workflow

Use AI coding agents as part of the normal development workflow, not as a separate experiment.
The goal is to reduce cognitive load, move faster, and still keep human engineering judgment in
control of architecture, quality, and final decisions.

## Persistent AI Context

Codex should have persistent user-level instructions. The official Codex documentation says the
global instruction file is `~/.codex/AGENTS.md` by default, unless `CODEX_HOME` points to another
Codex home directory. Keep that file under version control, then symlink it into place on each
machine.

Use this file to accumulate durable rules that should affect all projects: coding style,
preferred commands, review expectations, security constraints, naming conventions, and personal
workflow preferences. Do not try to keep everything in memory or repeat the same instructions in
every prompt.

Add a unique marker or magic number to the file and ask the agent to report it. This makes it much
easier to verify that the expected instruction file was actually loaded, especially when global,
repository, and nested instruction files are combined.

## Task Workflow

When the task is clear, write the prompt like a practical task specification for another
developer. Describe the desired behavior, important fields, constraints, and implementation
details that matter. The prompt does not need polished English or exhaustive wording. Good AI
coding agents can fill in small gaps when the direction is clear.

Use Codex with GPT-5.4 when available for implementation, codebase research, and alignment with
the existing project. Treat the repository context as part of the prompt: the agent should inspect
the structure, learn local patterns, and make the change in the style already present in the
codebase.

When extra context is easier to speak than type, dictate it, transcribe it, and paste the raw
transcription after the concise task specification. The specification gives the agent the target;
the transcription gives background and nuance.

## First Implementation Pass

Treat the first Codex implementation as a draft. At this stage, usually tell Codex not to create
tests and not to create Django migrations. The implementation will often need refactoring after
review, so writing tests too early can waste time and tokens because those tests may need to be
rewritten together with the code.

For Django changes, generate migrations after the implementation has settled. This avoids
reviewing and regenerating migration files for code that may still change substantially.

After Codex creates the first draft, commit the changes and open a draft pull request. This makes
the diff easier to inspect and turns the review into a concrete file-by-file process.

## Research Workflow

When the task is not clear, research before implementation.

If the topic is completely new, use ChatGPT first to learn the concepts, compare options, and
understand the design space. This is useful for unfamiliar areas such as new machine learning
techniques, infrastructure concepts, or domains where the architecture is not obvious yet.

If the topic is mostly clear but needs project-specific investigation, research directly in
Codex. Codex has the codebase in context, so it is better for understanding local constraints,
existing abstractions, dependencies, and the tradeoffs of different implementation options inside
the current project.

After the research phase, turn the chosen approach into a concrete Codex task. Paste any useful
notes from ChatGPT into Codex when they help preserve context, but let Codex do the final
alignment with the repository.

## Refactoring Workflow

Review the draft file by file. When you see issues, use one of three refactoring paths.

Most often, describe the desired change in plain English and ask Codex to make it: merge two
functions, remove a parameter, simplify a branch, rename an object, move logic to a better place,
or apply another specific refactoring. If the explanation is long, dictate it and paste the
transcription into Codex or use a voice transcription MCP such as Voice Code.

Often, start the refactoring yourself to show the direction, then ask Codex to complete it. This
works well when the intended shape is obvious from the partial change. When it is less obvious,
combine the partial code change with explicit instructions about what still needs to be done.

Least often, refactor fully by hand. This is mainly useful for complicated algorithms or logic
where the intended change is easier to express in code than in English. Even then, once the
direction becomes clear enough, hand the remaining mechanical work back to Codex.

## Human Responsibility

AI can produce the implementation, but the developer still owns the result. Review the generated
changes, check that they follow the local best practices, remove unnecessary complexity, and
verify behavior before publishing.

See also:
- [Use AI for Coding as Much as Possible](../general-principles/use-ai.md)
- [Review and Refactor AI-Generated Code](../general-principles/review-and-refactor-ai-code.md)

[Back](../README.md)
