# Depth Anything 3: Recovering the Visual Space from Any Views

[Paper](https://arxiv.org/abs/2511.10647) · [Inspected full-text version](https://arxiv.org/html/2511.10647v1)

- **Authors:** Haotong Lin et al.
- **Date:** 2025 initial preprint
- **Topic:** Perception / 3D geometry / AI
- **Level:** Intermediate → advanced
- **Reading priority:** High: bridge between geometry and AI
- **Publication status:** ArXiv research paper; acceptance venue not separately verified.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

Depth Anything 3 estimates consistent geometry from one or multiple images, optionally using known camera poses. It uses a transformer and a depth-ray representation, with teacher–student learning. The paper also develops an evaluation framework covering geometry, camera poses, and rendering.

## Important parts to learn

- **MUST LEARN: depth, camera rays, coordinate frames, and back-projection.**
- **MUST LEARN: relative geometry versus metric scale.**
- **ADVANCED: teacher–student training and multi-view consistency.**

## Where to focus your reading

Sections 3.1–3.2, 4, and 6. Read the metric-model discussion before treating predicted depth as distance in meters.

**Prerequisites:** Camera projection, matrix transforms, deep-learning basics, and 3D geometry.

## Small exercise — suggested, not executed

Given intrinsics and a depth image, back-project pixels into a point cloud. Disturb the depth scale and intrinsics separately; explain the resulting geometric errors.

## Critical reading

My assessment: evaluate scale, uncertainty, dynamic objects, and out-of-domain scenes before using estimated geometry for collision avoidance.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
