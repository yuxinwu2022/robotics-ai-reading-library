# DROID: A Large-Scale In-The-Wild Robot Manipulation Dataset

[Paper](https://arxiv.org/abs/2403.12945) · [Inspected full-text version](https://arxiv.org/html/2403.12945v1) · [Additional primary resource](https://droid-dataset.github.io/)

- **Authors:** Alexander Khazatsky et al.
- **Date:** 2024
- **Topic:** Datasets / evaluation
- **Level:** Beginner overview → advanced analysis
- **Reading priority:** Essential
- **Publication status:** Research paper; arXiv version linked, acceptance venue not separately checked.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

DROID addresses the limited environmental diversity of robot demonstrations through distributed collection in varied scenes. Its contribution includes a manipulation dataset, a collection platform and protocol, and policy-learning experiments. The paper explicitly analyzes diversity rather than treating trajectory count as the only measure of dataset quality.

## Important parts to learn

- **MUST LEARN: task, object, scene, and viewpoint diversity.**
- **MUST LEARN: observation/action conventions and collection protocols.**
- **ADVANCED: how dataset composition changes policy generalization.**

## Where to focus your reading

Section III, Data Collection Setup, and IV, Dataset Analysis, followed by the policy evaluation.

**Prerequisites:** Basic datasets and supervised learning; no advanced mathematics needed for a first pass.

## Small exercise — suggested, not executed

Design a 100-demonstration collection plan. Allocate examples across scenes, objects, operators, and failures. Hold out entire scenes and explain what your split tests.

## Critical reading

My assessment: random frame splits can leak near-identical trajectories across train and test. Dataset scale is not a substitute for a meaningful split.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
