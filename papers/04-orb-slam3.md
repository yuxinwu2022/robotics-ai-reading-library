# ORB-SLAM3: An Accurate Open-Source Library for Visual, Visual-Inertial and Multi-Map SLAM

[Paper](https://arxiv.org/abs/2007.11898) · [Inspected full-text version](https://arxiv.org/html/2007.11898v2) · [Additional primary resource](https://doi.org/10.1109/TRO.2021.3075644)

- **Authors:** Carlos Campos et al.
- **Date:** 2020 preprint / 2021 journal
- **Topic:** State estimation / SLAM
- **Level:** Intermediate → advanced
- **Reading priority:** Essential
- **Publication status:** IEEE Transactions on Robotics 2021; related DOI is listed in arXiv.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

ORB-SLAM3 combines feature-based visual and inertial estimation with support for multiple maps. It handles monocular, stereo, and RGB-D camera configurations. When tracking fails, a new map can be built and later merged with previous maps through place recognition. The system emphasizes maximum-a-posteriori estimation and reuse of earlier observations.

## Important parts to learn

- **MUST LEARN: tracking, local mapping, bundle adjustment, and loop closure.**
- **MUST LEARN: scale ambiguity and how additional sensors constrain it.**
- **ADVANCED: visual-inertial initialization and multi-map merging.**

## Where to focus your reading

Read the system overview and visual-inertial and multi-map contributions. Compare sensor configurations in the experiments.

**Prerequisites:** Camera projection, feature matching, SE(3), least squares, and basic Bayesian estimation.

## Small exercise — suggested, not executed

Design an evaluation that distinguishes frame-to-frame drift from global trajectory error. Specify ground truth, alignment, sensor configuration, and how lost tracking is counted.

## Critical reading

My assessment: illumination, texture, calibration, and synchronization can dominate performance; include tracking failures when comparing systems.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
