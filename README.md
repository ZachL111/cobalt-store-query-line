# cobalt-store-query-line

`cobalt-store-query-line` is a Swift project for Databases. It turns develop a Swift command-oriented project for query scenarios with capacity fixtures, allocation and spill reports, and offline replay mode into a small local model with readable fixtures and a direct verification command.

## Reading Cobalt Store Query Line

Start with the README, then open `metadata/project.json` to check the constants behind the examples. After that, `fixtures/cases.csv` shows the compact path and `examples/extended_cases.csv` gives a wider look at the same rule.

## Purpose

The goal is to capture the core behavior in code and make the surrounding assumptions obvious. A reader should be able to run the verifier, open the fixtures, and understand why each decision was made.

## Fixture Notes

`degraded` is the first example I would inspect because it lands on the `review` path with a score of 45. The broader file also keeps `degraded` at 45 and `surge` at 237, which gives the model a useful low-to-high spread.

## Design Sketch

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps schema shape, query checks, and fixture rows in one explicit decision path. The threshold is 151, with risk penalty 4, latency penalty 2, and weight bonus 3. The Swift project compiles a minimal command-line test harness against the local Windows SDK.

## What It Does

- Models schema shape with deterministic scoring and explicit review decisions.
- Uses fixture data to keep query checks changes visible in code review.
- Includes extended examples for fixture rows, including `surge` and `degraded`.
- Documents constraint behavior tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Verification

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Files Worth Reading

- `src`: primary implementation
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Next Directions

- Split the scoring constants into a typed configuration object and validate it before use.
- Add a comparison mode that shows how decisions change when one signal is adjusted.
- Add a loader for `examples/extended_cases.csv` and promote selected cases into the language test suite.
- Add one more databases fixture that focuses on a malformed or borderline input.

## Limits

This code is local-first. It makes no claim about deployed usage and avoids credentials, hosted state, and environment-specific setup.

## Setup

The only required setup is the local Swift toolchain. After cloning, stay in the repo root so fixture paths resolve correctly.
