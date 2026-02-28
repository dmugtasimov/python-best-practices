# Backward Compatibility

Backward compatibility means that a newer version of a component works correctly with existing clients,
consumers, or dependent systems — without requiring changes on their side.

---

## Why It Matters

### Independent deployment
This is the most operationally significant reason. When your API or service interface is backward
compatible, you can deploy the backend without coordinating with the frontend. You can deploy a service
without requiring all consuming services to update at the same time. Each component evolves and ships
on its own schedule. Without backward compatibility, every deployment becomes a coordinated event
across multiple teams and systems — a significant operational burden and a major source of risk.

### Zero-downtime deployments
Backward compatibility is a prerequisite for zero-downtime rolling deployments. During a rollout, old
and new versions of a service run simultaneously. If the new version breaks the interface, the old
clients — still running — start failing. Compatibility ensures traffic routes correctly to both
versions until the rollout completes.

### Public libraries don't force consumer code changes
When you publish a Python library and release a new version, downstream users should be able to upgrade
with no changes to their own code. Breaking compatibility forces every consumer to audit and update
their code just to stay current. Many will delay upgrades indefinitely, fragmenting your user base
across versions and making support harder. Some will abandon the library entirely.

### Reduced coordination overhead
Without backward compatibility, every breaking change requires explicit coordination: notify consumers,
agree on a migration timeline, make changes in lockstep. This creates tight coupling at the
organizational level, not just the technical level. With compatibility, teams can move independently.

### Lower risk per change
Additive, backward-compatible changes are inherently lower risk. They can be deployed, observed, and
rolled back without affecting existing behavior. Breaking changes carry significantly higher risk
because they require simultaneous correctness in multiple places.

### Data longevity
Stored data — database records, serialized objects, message queue payloads, files — must remain
readable as the system evolves. A schema change that is not backward compatible can render existing
data unreadable or require a migration that locks or risks the dataset.

---

## What Breaks When You Ignore It

### Forced coordinated deployments
A breaking API change means the backend and all consumers must deploy together, in sequence, within
a narrow time window. If anything goes wrong, rollback is complicated because reverting one component
may break the others. What should be a routine deployment becomes a high-risk event.

### Cascading failures during partial rollouts
In microservice architectures, services deploy at different rates. A breaking change in a shared
interface causes failures in services that haven't yet updated — even briefly. In high-traffic
systems, brief can mean thousands of errors.

### Blocked upgrades in dependent libraries
A Python library that breaks its API between minor versions will see users pin the old version and
stop upgrading. The community fragments. Security fixes and performance improvements in newer versions
don't reach those users. The library's effective audience shrinks.

---

## How to Maintain Backward Compatibility

- **Add, don't remove or rename.** New fields, parameters, and endpoints are safe. Removing or
  renaming existing ones is a breaking change.
- **Make new parameters optional.** A function or API endpoint that gains a required parameter is a
  breaking change. New parameters should have defaults.
- **Use deprecation warnings before removal.** Mark something as deprecated in version N.
  Remove it no earlier than version N+2 (or after a defined deprecation period). Python's own
  policy requires at least two full release cycles.
- **Version your APIs explicitly when breaking changes are unavoidable.** `/api/v1/` and `/api/v2/`
  can coexist, letting consumers migrate on their own schedule.
- **Treat message schemas as contracts.** In event-driven systems, published message formats are
  consumed by code you don't control. Add fields; never remove or reinterpret existing ones.

### Database schema changes

Database migrations deserve special attention because they affect both running code and stored data
simultaneously. The application code before and after deployment must both work against the same
database during a rolling deploy.

This is extremely important for zero-downtime deployments. In case of acceptable short downtime or
low percent of failures some of these rules can be relaxed.

**Safe operations — can be applied without coordination:**

- Adding a nullable column (existing rows get `NULL`; old code ignores the column)
- Adding a column with a default value (existing rows backfill the default; old code ignores it)
- Adding a new table or index (purely additive; old code is unaffected)
- Adding an index (no schema change visible to application code; may lock briefly on large tables —
  use `CREATE INDEX CONCURRENTLY` in PostgreSQL)
- Widening a column (e.g. `VARCHAR(50)` → `VARCHAR(255)`)
- Making a column nullable (loosens the constraint; old code still works)

**Operations requiring extra care:**

- **Adding a `NOT NULL` column without a default** — fails immediately for old code that inserts
  rows without that column. Always provide a default, or make it nullable first and tighten the
  constraint in a later migration after all code paths populate the value.
- **Renaming a column or table** — old code references the old name; new code references the new
  name. Both cannot be true at the same time. Safe approach: add the new column, deploy code that
  writes to both, backfill, switch reads to the new column, deploy code that drops the old write,
  then drop the old column in a final migration.
- **Removing a column or table** — old code still tries to read or write it. Remove the column only
  after all code referencing it is fully deployed and verified gone.
- **Adding a unique constraint** — fails if existing data already has duplicates. Clean the data
  first in a separate migration.
- **Making a column non-nullable** — fails if existing rows contain `NULL`. Backfill all nulls
  first, then apply the constraint.
- **Changing a column type** — may be incompatible with what old code writes or reads (e.g.
  `integer` → `text`). Treat this the same as a rename: add a new column, migrate data, switch
  code, drop the old column.
- **Long-running migrations on large tables** — operations like adding a non-nullable column,
  rewriting a table, or building a large index can lock the table for minutes. Use
  `CONCURRENTLY`, batched updates, or background migration strategies. A blocking migration
  causes downtime regardless of how safe the schema change itself is.

---

## The Core Principle

Every interface you expose — REST endpoint, Python function, library API, message schema, CLI argument
— is a contract with its consumers. Backward compatibility is honoring that contract. Breaking it
forces the cost of your change onto everyone who depends on you, often at a time and in a way that is
inconvenient for them.

Design interfaces to be extended, not replaced.

[Back](../README.md)
