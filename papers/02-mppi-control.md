# Information Theoretic Model Predictive Control: Theory and Applications to Autonomous Driving

[Paper](https://arxiv.org/abs/1707.02342) · [Inspected full-text version](https://arxiv.org/html/1707.02342v1)

- **Authors:** Grady Williams et al.
- **Date:** 2017
- **Topic:** Control
- **Level:** Intermediate → advanced
- **Reading priority:** Essential
- **Publication status:** Research paper; arXiv version linked, venue not separately verified.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

This work derives a sampling-based controller from an information-theoretic treatment of stochastic optimal control. Candidate control sequences are rolled out through a dynamics model and used to update the control distribution. The authors test aggressive autonomous driving and compare against a cross-entropy controller.

## Important parts to learn

- **MUST LEARN: receding-horizon control.** Optimize a sequence, apply its first command, and repeat with new observations.
- **MUST LEARN: trajectory costs, importance sampling, and temperature.**
- **ADVANCED: the KL-divergence derivation and practical control constraints.**

## Where to focus your reading

Sections III-D and III-E for implementation, then III-A–III-C for the derivation. Inspect VII-E, Failure Modes.

**Prerequisites:** Dynamical systems, probability, optimization, and introductory MPC.

## Small exercise — suggested, not executed

Build a sampling MPC controller for a simulated point mass. Sweep horizon, samples, and temperature; record tracking error, control smoothness, and computation time.

## Critical reading

My assessment: a model and cost that work in nominal conditions can fail under mismatch; sampling alone does not guarantee constraint satisfaction.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
