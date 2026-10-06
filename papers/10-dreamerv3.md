# Mastering diverse control tasks through world models

[Paper](https://www.nature.com/articles/s41586-025-08744-2)

- **Authors:** Danijar Hafner et al.
- **Date:** 2025 Nature publication
- **Topic:** AI / model-based RL
- **Level:** Advanced
- **Reading priority:** After introductory RL
- **Publication status:** Peer-reviewed Nature article, published 2025-04-02.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

DreamerV3 learns a world model, an actor, and a critic together. The world model supports imagined rollouts for learning behavior; the paper emphasizes techniques that keep training stable across different observation and reward scales. Its experiments span diverse simulated control and game tasks using a common configuration.

## Important parts to learn

- **MUST LEARN: representation learning and imagined latent rollouts.**
- **MUST LEARN: the roles of world model, actor, and critic.**
- **ADVANCED: KL balancing, free bits, symlog transforms, and return normalization.**

## Where to focus your reading

Learning algorithm, Methods, and Ablations. Figure 6 helps connect stabilizing choices to empirical evidence.

**Prerequisites:** Actor–critic RL, probability distributions, recurrent networks, and variational inference.

## Small exercise — suggested, not executed

Make a side-by-side diagram of DreamerV3 and TD-MPC2. Identify which decisions use online trajectory optimization and which rely on a learned actor.

## Critical reading

My assessment: simulated control and game results are evidence about the evaluated environments; they do not by themselves validate contact-rich physical deployment.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
