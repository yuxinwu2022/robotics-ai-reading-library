# TD-MPC2: Scalable, Robust World Models for Continuous Control

[Paper](https://arxiv.org/abs/2310.16828) · [Inspected full-text version](https://arxiv.org/html/2310.16828v1)

- **Authors:** Nicklas Hansen, Hao Su, and Xiaolong Wang
- **Date:** 2023 initial preprint
- **Topic:** Control / model-based RL
- **Level:** Advanced
- **Reading priority:** After MPC and RL foundations
- **Publication status:** Research paper; initial arXiv version linked, acceptance venue not separately checked.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

TD-MPC2 learns an implicit latent dynamics model and plans control trajectories in that latent space. It combines online optimization with a learned policy prior and improves robustness across varied continuous-control tasks. The paper studies performance across many tasks and how capabilities scale with model and data size.

## Important parts to learn

- **MUST LEARN: learned latent dynamics versus a hand-specified physical model.**
- **MUST LEARN: planning with a terminal value estimate and policy prior.**
- **ADVANCED: normalization, multi-task embeddings, and scaling experiments.**

## Where to focus your reading

Sections 3.1–3.3; Appendix A summarizes improvements. Read the risks discussion before interpreting scaling plots.

**Prerequisites:** MPC, Bellman equations, actor–critic RL, replay buffers, and neural-network training.

## Small exercise — suggested, not executed

Draw the computation graph for one planning step. Label where the dynamics, reward, value function, and policy prior are used. Compare it with the MPPI note.

## Critical reading

My assessment: success in simulation does not establish real-robot transfer. Separate model-learning error, planning budget, and environment interaction cost.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
