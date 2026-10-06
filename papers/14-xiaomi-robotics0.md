# Xiaomi-Robotics-0: An Open-Sourced Vision-Language-Action Model with Real-Time Execution

[Paper](https://arxiv.org/abs/2602.12684) · [Inspected full-text version](https://arxiv.org/html/2602.12684v1) · [Additional primary resource](https://xiaomi-robotics-0.github.io/)

- **Authors:** Xiaomi Robotics
- **Date:** 2026 initial preprint
- **Topic:** AI / deployment / manipulation
- **Level:** Advanced
- **Reading priority:** Recent research: read after SmolVLA
- **Publication status:** ArXiv technical report, first submitted 2026-02-13; peer-review status not verified.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

This report studies both VLA training and smooth asynchronous execution. It combines a vision-language backbone with a flow-matching action model, uses joint robot and vision-language training, and post-trains with an action prefix. Its attention design limits copying from the prefix, while deployment aligns consecutive action chunks in time.

## Important parts to learn

- **MUST LEARN: inference latency, timestamp alignment, and chunk continuity.**
- **MUST LEARN: the shortcut created by conditioning on previous actions.**
- **ADVANCED: the Λ-shaped attention mask and staged training.**

## Where to focus your reading

Sections 2.2.2 and 2.3, Figures 4–5, then the real-robot evaluation. Study Table 1 with its benchmark protocol.

**Prerequisites:** Flow matching, transformer attention, VLA training, and action chunking.

## Small exercise — suggested, not executed

Simulate a queue with variable inference delays. Specify which predicted commands are already obsolete when a chunk arrives. Compare a naive splice with time-aligned replacement.

## Critical reading

My assessment: the report evaluates a particular platform and two physical tasks. Benchmark success and smooth motion are different evidence from broad deployment reliability.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
