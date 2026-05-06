# Cobalt Store Query Line Walkthrough

This note is the quickest way to read the extra review model in `cobalt-store-query-line`.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | index fit | 240 | ship |
| stress | join width | 195 | ship |
| edge | constraint risk | 205 | ship |
| recovery | plan drift | 246 | ship |
| stale | index fit | 212 | ship |

Start with `recovery` and `stress`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The next useful expansion would be a malformed fixture around join width and plan drift.
