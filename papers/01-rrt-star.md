# Sampling-based Algorithms for Optimal Motion Planning

[Paper](https://arxiv.org/abs/1105.1186) · [Inspected full-text version](https://arxiv.org/html/1105.1186v1)

- **Authors:** Sertac Karaman and Emilio Frazzoli
- **Date:** 2011
- **Topic:** Planning
- **Level:** Intermediate → advanced
- **Reading priority:** Essential
- **Publication status:** Research paper; arXiv version linked, journal venue not separately verified.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

The paper separates finding a feasible path from improving its cost. It shows that familiar sampling methods can converge to a suboptimal solution, and introduces PRM* and RRT* with asymptotic optimality under stated assumptions. This is a foundation for understanding what a planner can actually guarantee.

## Important parts to learn

- **MUST LEARN: probabilistic completeness versus asymptotic optimality.** Finding a path and approaching the best path are different properties.
- **MUST LEARN: choosing a parent and rewiring nearby vertices in RRT*.**
- **ADVANCED: connection-radius scaling and the assumptions behind the proofs.**

## Where to focus your reading

Read the problem formulation, algorithm descriptions, and discussion of optimality. Implement the basic planner before tackling the proofs.

**Prerequisites:** Graphs, Euclidean geometry, probability, and basic path planning.

## Small exercise — suggested, not executed

Implement RRT and RRT* on the same 2D obstacle map. Across several seeds, plot best path cost against samples and wall-clock time. Include a narrow passage.

## Critical reading

My assessment: asymptotic optimality does not promise a good solution within a small runtime budget; collision-checking cost matters.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
