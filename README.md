# Python Best Practices

Python Best Practices developed by Dmitry Mugtasimov during the course of his 26-year career in software engineering.

**DISCLAIMER**: *This repository documents Python best practices as I have developed and refined them over 26 years
of professional software engineering. They reflect my experience, reasoning, and approach to building and
maintaining software, and are shared as a practical reference rather than as a definitive or universal standard.
As with any engineering guidance, their applicability may vary depending on context, constraints, and goals.*

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

## General Principles

- Respect best practices
- Respect industry standards
- Respect backward compatibility
- Respect forward compatibility
- [The Less code (lines) the better](./general-principles/less-code.md)
- Write code to be read (by humans and AI), not just to be executed
- [DRY](general-principles/dry.md) (Don't Repeat Yourself)
- KISS (Keep It Simple, Stupid)
- YAGNI (You Aren't Gonna Need It)
- Principle of Least Astonishment
- Start new project with latest dependencies if possible
- Have a reason behind every decision
- Respect business needs over technical preferences
- Automate repetitive tasks
- Use AI for coding as much as possible
- Review and refactor AI-generated code
- Continuous refactoring
- Unit testing
- Continuous Learning
- and more...

## General Coding Rules

- Declare and assign variable values as close to the usages as possible
- Do not put a value to a variable if it is then read just once
- Do not implement logic that depends on environment name the code is running in
- Do not hard code a list of environments
- Avoid dead code
- [Use comments and docstrings reasonably](general-coding-rules/comments.md)
- Use asserts to describe expected invariants and assumptions in the code
- [Use TODO or FIX comments](general-coding-rules/todo-comments.md) to describe technical debt and convey intended imperfections to other developers
- and more...

## Python Specific Rules

- Follow [PEP 8](https://peps.python.org/pep-0008/) coding style guide, read more [here](./python-specific-rules/follow-pep8.md)
- In except clause always prefer `.exception()` over `.error()` logger method, unless you have a good reason for otherwise
- and more... 
