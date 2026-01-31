# Python Best Practices

DISCLAIMER: This repository documents Python best practices as I have developed and refined them over 26 years
of professional software engineering. They reflect my experience, reasoning, and approach to building and
maintaining software, and are shared as a practical reference rather than as a definitive or universal standard.
As with any engineering guidance, their applicability may vary depending on context, constraints, and goals.

## Technology stack

### Core

- [Python](https://www.python.org/)
- [Django](https://www.djangoproject.com/)
- [Django REST Framework](https://www.django-rest-framework.org/) (alternatively [FastAPI](https://fastapi.tiangolo.com/) + [SQLAlchemy](https://www.sqlalchemy.org/) + [Alembic](https://alembic.sqlalchemy.org/))
- [Celery](https://docs.celeryproject.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [RabbitMQ](https://www.rabbitmq.com/)
- [Redis](https://redis.io/) 

### DevOps & Infrastructure

- [uv](https://github.com/astral-sh/uv) (earlier [Poetry](https://python-poetry.org/) + [pyenv](https://github.com/pyenv/pyenv))
- [Docker](https://www.docker.com/) + [Docker Compose](https://docs.docker.com/compose/)
- [Pulumi](https://www.pulumi.com/)
- [Sentry](https://sentry.io/)
- [AWS](https://aws.amazon.com/)
- [Uvicorn](https://www.uvicorn.org/), [Gunicorn](https://gunicorn.org/)
- [NGINX](https://nginx.org/) (or [Traefik](https://traefik.io/) for containerized deployments)
- [Let's Encrypt](https://letsencrypt.org/)
- [GitHub Actions](https://github.com/features/actions)

### Development & Quality Assurance Tools

- [PyCharm](https://www.jetbrains.com/pycharm/)
- [Claude Code](https://www.anthropic.com/claude)
- [Codex CLI](https://github.com/openai/codex)
- [ChatGPT](https://chat.openai.com/)
- [GitHub Copilot](https://github.com/features/copilot)
- [pytest](https://pytest.org/)
- [diff-cover](https://github.com/Bachmann1234/diff_cover)
- [pre-commit](https://pre-commit.com/)
- [Ruff](https://github.com/astral-sh/ruff)
- [GNU Make](https://www.gnu.org/software/make/)
- [model-bakery](https://model-bakery.readthedocs.io/)
- [ngrok](https://ngrok.com/)
- [VCR.py](https://vcrpy.readthedocs.io/)
- [Moto](https://github.com/getmoto/moto)
- [pdbpp](https://github.com/pdbpp/pdbpp)
- [colorlog](https://github.com/borntyping/python-colorlog)

### Libraries

- [django-split-settings](https://github.com/sobolevn/django-split-settings)
- [django-restql](https://github.com/yezyilomo/django-restql)
- [django-dirtyfields](https://github.com/romgar/django-dirtyfields)
- [WhiteNoise](https://whitenoise.readthedocs.io/)
- [Anymail](https://anymail.dev/)
- [python-jose](https://github.com/mpdavis/python-jose)
- [Jinja](https://jinja.palletsprojects.com/)
- [time-machine](https://github.com/adamchainz/time-machine)
- [Pydantic](https://docs.pydantic.dev/)
- [tqdm](https://github.com/tqdm/tqdm)
- [cachetools](https://github.com/tkem/cachetools)
- [HTTPX](https://www.python-httpx.org/) (preferred over [Requests](https://requests.readthedocs.io/))
- [Tenacity](https://tenacity.readthedocs.io/)
- [Beautiful Soup](https://www.crummy.com/software/BeautifulSoup/)
- [Liquid](https://jg-rp.github.io/liquid/)
