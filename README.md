# cobalt-store-query-line

`cobalt-store-query-line` keeps a focused Swift implementation around databases. The project goal is to develop a Swift command-oriented project for query scenarios with capacity fixtures, allocation and spill reports, and offline replay mode.

## Problem It Tries To Make Smaller

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Cobalt Store Query Line Review Notes

Start with `plan drift` and `join width`. Those cases create the widest score spread in this repo, so they are the best quick check when the model changes.

## Working Pieces

- `fixtures/domain_review.csv` adds cases for index fit and join width.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/cobalt-store-query-walkthrough.md` walks through the case spread.
- The Swift code includes a review path for `plan drift` and `join width`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Design Notes

The repository has two validation layers: the original compact policy fixture and the domain review fixture. They are separate so one can change without hiding failures in the other.

The Swift code keeps the review rule close to the tests.

## Example Run

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Tests

The verifier is intentionally local. It should fail if the fixture score math, lane assignment, or language-specific test drifts.

## Known Limits

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
