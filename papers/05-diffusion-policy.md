# Diffusion Policy: Visuomotor Policy Learning via Action Diffusion

[Paper](https://arxiv.org/abs/2303.04137) · [Inspected full-text version](https://arxiv.org/html/2303.04137v5) · [Additional primary resource](https://diffusion-policy.cs.columbia.edu/)

- **Authors:** Cheng Chi et al.
- **Date:** 2023 / 2024 journal extension
- **Topic:** Robot learning / manipulation
- **Level:** Intermediate → advanced
- **Reading priority:** Essential
- **Publication status:** RSS 2023 and IJRR 2024 extension, verified on the authors' project page.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

Diffusion Policy generates robot action sequences by iteratively denoising samples conditioned on observations. This can represent multiple valid behaviors without averaging them into an undesirable action. A receding-horizon execution scheme combines sequence prediction with feedback. The project provides simulation and real-robot implementations and introductory notebooks.

## Important parts to learn

- **MUST LEARN: why mean-squared-error behavior cloning can average distinct behaviors.**
- **MUST LEARN: the noise-prediction objective and observation conditioning.**
- **MUST LEARN: observation, prediction, and execution horizons.**

## Where to focus your reading

Section 2, Diffusion Policy Formulation, then the receding-horizon design and ablations. The linked v5 is the expanded journal version.

**Prerequisites:** PyTorch, supervised learning, Gaussian noise, and basic neural networks.

## Small exercise — suggested, not executed

Use a toy dataset with two valid routes around an obstacle. Compare deterministic regression with a generative policy; examine sampled trajectories before attempting robot experiments.

## Critical reading

My assessment: compare rollout success and inference latency as well as training loss; demonstration coverage still limits learned behavior.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
