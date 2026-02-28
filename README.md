# Python Best Practices

Python Best Practices developed by [Dmitry Mugtasimov](mailto:dmugtasimov@gmail.com) during the course of his 26-year career in software engineering.

**DISCLAIMER**: *This repository documents Python best practices as I have developed and refined them over 26 years
of professional software engineering. They reflect my experience, reasoning, and approach to building and
maintaining software, and are shared as a practical reference rather than as a definitive or universal standard.
As with any engineering guidance, their applicability may vary depending on context, constraints, and goals.*

**DISCLAIMER 2**: *This is "work in progress" repository. If you did not find something you might have expected then
it just not written*

You can contact me via:
- Email: [dmugtasimov@gmail.com](mailto:dmugtasimov@gmail.com)
- X: [@dmugtasimov](https://x.com/dmugtasimov)
- Telegram: [@dmugtasimov](https://t.me/dmugtasimov)

## Table of Contents

- [Technology Stack](#technology-stack)
- [General Principles](#general-principles)
- [General Coding Rules](#general-coding-rules)
- [Python Specific Rules](#python-specific-rules)

## Technology Stack

### Core

- [Python](https://www.python.org/) - programming language
- [Django](https://www.djangoproject.com/) - web framework
- [Django REST Framework](https://www.django-rest-framework.org/)
  (alternatively [FastAPI](https://fastapi.tiangolo.com/) + 
   [SQLAlchemy](https://www.sqlalchemy.org/) + [Alembic](https://alembic.sqlalchemy.org/)) - REST API framework
- [Celery](https://docs.celeryproject.org/) - distributed task queue
- [PostgreSQL](https://www.postgresql.org/) - relational database
- [RabbitMQ](https://www.rabbitmq.com/) - message broker
- [Redis](https://redis.io/) - in-memory data store 

### DevOps & Infrastructure

- [uv](https://github.com/astral-sh/uv) (earlier [Poetry](https://python-poetry.org/) + [pyenv](https://github.com/pyenv/pyenv)) - package management
- [Docker](https://www.docker.com/) + [Docker Compose](https://docs.docker.com/compose/) - containerization platform
- [Pulumi](https://www.pulumi.com/) - infrastructure as code
- [Sentry](https://sentry.io/) - error tracking
- [AWS](https://aws.amazon.com/) - cloud platform
- [Uvicorn](https://www.uvicorn.org/), [Gunicorn](https://gunicorn.org/) - application servers
- [NGINX](https://nginx.org/) (or [Traefik](https://traefik.io/) for containerized deployments)  - load balancer and reverse proxy
- [Let's Encrypt](https://letsencrypt.org/) - SSL/TLS certificate authority
- [GitHub Actions](https://github.com/features/actions) - CI/CD platform

### Development & Quality Assurance Tools

- [PyCharm](https://www.jetbrains.com/pycharm/) - [IDE](technology-stack/ide.md)
- AI coding assistants
  - [Claude Code](https://www.anthropic.com/claude)
  - [Codex CLI](https://github.com/openai/codex)
  - [ChatGPT](https://chat.openai.com/)
  - [GitHub Copilot](https://github.com/features/copilot)
- [Linear](https://linear.app/) (alternatively - [GitHub Projects](https://github.com/features/issues)) - project management
- [pytest](https://pytest.org/) - testing framework
- [diff-cover](https://github.com/Bachmann1234/diff_cover) - test coverage tool
- [pre-commit](https://pre-commit.com/) - git hook manager
- [Ruff](https://github.com/astral-sh/ruff) (earlier [Flake8](https://flake8.pycqa.org/), [Pylint](https://pylint.org/)) - linting and formatting
- [GNU Make](https://www.gnu.org/software/make/) - command automation
- [model-bakery](https://model-bakery.readthedocs.io/) - fixture factory
- [ngrok](https://ngrok.com/) - local tunneling service
- [VCR.py](https://vcrpy.readthedocs.io/) - HTTP interaction recording
- [Moto](https://github.com/getmoto/moto) - AWS service mocking
- [pdbpp](https://github.com/pdbpp/pdbpp) - enhanced debugger
- [colorlog](https://github.com/borntyping/python-colorlog) - colored logging

### Libraries

- [django-split-settings](https://github.com/sobolevn/django-split-settings) - settings organization
- [django-restql](https://github.com/yezyilomo/django-restql) - GraphQL-like API queries
- [django-dirtyfields](https://github.com/romgar/django-dirtyfields) - model field change tracking
- [WhiteNoise](https://whitenoise.readthedocs.io/) - static file serving
- [Anymail](https://anymail.dev/) - email service integration
- [python-jose](https://github.com/mpdavis/python-jose) - JWT library
- [Jinja](https://jinja.palletsprojects.com/) - template engine
- [time-machine](https://github.com/adamchainz/time-machine) - time mocking for tests
- [Pydantic](https://docs.pydantic.dev/) - data validation
- [tqdm](https://github.com/tqdm/tqdm) - progress bars
- [cachetools](https://github.com/tkem/cachetools) - caching utilities
- [HTTPX](https://www.python-httpx.org/) (preferred over [Requests](https://requests.readthedocs.io/)) - HTTP client
- [Tenacity](https://tenacity.readthedocs.io/) - retry library
- [Beautiful Soup](https://www.crummy.com/software/BeautifulSoup/) - HTML/XML parser
- [Liquid](https://jg-rp.github.io/liquid/) - template engine

## General Software Development Principles

- [Respect best practices](general-principles/best-practices.md)
- [Respect industry standards](general-principles/industry-standards.md)
- [Respect backward compatibility](general-principles/backward-compatibility.md)
- Respect forward compatibility
- [Write code to be read by humans](general-principles/write-code-to-be-read.md) (and AI), not just to be executed
- [Continuous refactoring](general-principles/continuous-refactoring.md)
- [Continuous Learning](general-principles/continuous-learing.md)
- [Use AI for coding as much as possible](general-principles/use-ai.md)
- [Review and refactor AI-generated code](general-principles/review-and-refactor-ai-code.md)
- [The Less code (lines) the better](general-principles/less-code.md)
- [DRY](general-principles/dry.md) (Don't Repeat Yourself)
- KISS (Keep It Simple, Stupid)
- [YAGNI](general-principles/yagni.md) (You Aren't Gonna Need It)
- Principle of Least Astonishment
- Code reuse
- Encapsulation
- Have a reason behind every decision
- Respect business needs over technical preferences
- Automate repetitive tasks
- [Unit testing](general-principles/unit-testing.md)
- Consistency
- and more...

## General Coding Rules

- Start new project with latest dependencies if possible
- Declare and assign variable values as close to the usages as possible
- Do not put a value to a variable if it is then read just once
- Do not implement logic that depends on environment name the code is running in
- Do not hard code a list of environments
- Avoid dead code
- Self and AI code review
- [Use comments and docstrings reasonably](general-coding-rules/comments.md)
- Use asserts to describe expected invariants and assumptions in the code
- [Use TODO or FIX comments](general-coding-rules/todo-comments.md) to describe technical debt and convey intended imperfections to other developers
- Implement database schema changes and related business logic in the same pull request
- [Use consistent data attributes naming](general-coding-rules/consistent-naming.md)
- Assign or declare variables as close to their usage as possible
- and more...

## Python Specific Rules

- Follow [PEP 8](https://peps.python.org/pep-0008/) coding style guide, read more [here](./python-specific-rules/follow-pep8.md)
- In except clause always prefer `.exception()` over `.error()` logger method, unless you have a good reason for otherwise
- Use keyword arguments for arguments with default values. Call `def f(arg='default'):` with `f(arg='value')` instead of `f('value')`.
- and more... 
