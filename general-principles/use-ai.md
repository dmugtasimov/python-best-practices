# Use AI for Coding as Much as Possible

I started working with AI in December 2022. Since then it gradually became a practical part of
my workflow, and now I use it for as much as possible for the software development process.

## Stages of AI Adoption

YouTube video: [4 Stages of AI Adoption That Changed How I Work](https://www.youtube.com/watch?v=CicXYoYsL3g)

My AI adoption went through four stages:

1. **Curiosity.** Experimenting with AI to see what it can do.
2. **Implementation aid.** Using AI to show me how to do things I didn't know how to do yet.
3. **Speed boost.** Using AI to do familiar things faster.
4. **Cognitive offload.** Delegating even well-understood tasks to AI to reduce mental effort
   and stay productive longer — even in cases when it's not strictly faster.

These stages build on each other. At maturity, all three practical stages apply simultaneously:
AI helps you learn new things, work faster on familiar ones, and sustain productivity by
reducing mental effort.

## My AI Toolset

YouTube video: [How I Use AI for Coding, Research, Code Review, and DevOps](https://www.youtube.com/watch?v=TqwhovZnAHw)

- **ChatGPT** (web interface) — used in early stages for everything because it was the only
  tool available. Now I use it rarely, mostly to learn completely new topics. I also used it as
  a voice transcription tool to produce context for other tools, but this use case is becoming
  less relevant as Claude Code now and Codex soon will support voice input.
- **GitHub Copilot** (PyCharm plugin) — I mostly use it for tab completion. More features have
  been added recently, but I haven't explored them because by that time I had already started
  using Claude Code and Codex.
- **Claude Code** (CLI) — my main tool for actual coding. I give it a concrete task, describe
  what should be implemented, specify the style, and get working code as a result. I rarely
  write code myself now. Even if I instantly know what code to write, I still give it to Claude
  Code to reduce cognitive load. This helps me stay productive longer and focus on higher-level
  aspects of the project that AI cannot handle on its own yet.
- **Codex CLI** — I use it more for research, exploring options, and thinking through
  approaches. Often I research with Codex and then feed the chosen approach into Claude Code
  for implementation. The main reason I rarely use Codex for actual coding is that it tends to
  overengineer solutions, add excessive defensive paths, and produce more code than necessary.
  It may be a matter of instructing it better and I am working on it, but Claude Code does what
  I need out of the box.

## How I Use AI Day-to-Day

### Code generation

I describe what needs to be implemented and let the AI produce working code. I aim for
end-to-end AI workflows where the tool completes the task autonomously with me in the loop.

### Code review

I use both Claude Code and Codex for code review. I switch to Opus 4.6 in Claude Code for
review tasks. I recommend using multiple tools because they find different issues and both are
useful.

### Other use cases

- **Fixing issues found during code review** — just copy and paste the finding and tell it to
  fix.
- **Refactoring** — sometimes I start a refactoring myself, add some notes right in the
  malformed code, and ask AI to finish it.
- **Implementing and fixing tests** — especially after refactoring or adding new features: I just tell AI to run the tests and fix any that fail.
- **System administration** — I recently started using Codex for sysadmin tasks on my laptop
  and for DevOps research. It types and executes commands much faster, analyzes tool output
  well, and reduces cognitive load significantly.

## Always Review AI Output

Of course, I review the results of AI work: I review the code, review tests thoroughly, and do
manual testing of the implemented features or fixed bugs. This currently consumes most of my time
and is the main source of cognitive load.

See also: [Review and Refactor AI-Generated Code](review-and-refactor-ai-code.md)

[Back](../README.md)
