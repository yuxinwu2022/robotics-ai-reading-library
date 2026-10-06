# LIO-SAM: Tightly-coupled Lidar Inertial Odometry via Smoothing and Mapping

[Paper](https://arxiv.org/abs/2007.00258) · [Inspected full-text version](https://arxiv.org/html/2007.00258v3)

- **Authors:** Tixiao Shan et al.
- **Date:** 2020
- **Topic:** State estimation / SLAM
- **Level:** Intermediate → advanced
- **Reading priority:** Essential
- **Publication status:** IROS 2020, identified in the arXiv record.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

LIO-SAM estimates robot motion and builds maps by combining LiDAR and inertial measurements in a factor graph. IMU preintegration helps correct motion distortion within a scan and initializes LiDAR optimization; LiDAR estimates also help estimate IMU bias. Local scan matching and selective keyframes support real-time operation.

## Important parts to learn

- **MUST LEARN: factors, residuals, measurement uncertainty, and graph optimization.**
- **MUST LEARN: IMU preintegration and point-cloud deskewing.**
- **ADVANCED: bias estimation, loop closure, and local-map computation.**

## Where to focus your reading

Follow the system diagram from sensors to estimation. Read the factor definitions and mapping pipeline before the evaluation.

**Prerequisites:** Rigid transforms, least squares, probability, point clouds, and IMU basics.

## Small exercise — suggested, not executed

Draw a small graph with three poses, inertial constraints, LiDAR constraints, and a loop closure. Explain each residual and which variables it constrains.

## Critical reading

My assessment: timestamps and sensor extrinsics belong in the estimation problem; a visually attractive map is insufficient evidence of trajectory accuracy.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
