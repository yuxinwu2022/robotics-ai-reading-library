# Suggested eight-week reading plan

A flexible sequence, not a deadline or an automation. Suggested budget: **4–6 hours per week**. If prerequisites are unfamiliar, stretch each week to two weeks. Advanced papers can be skimmed initially and revisited later.

| Week | Main reading | Important target | Deliverable |
|---|---|---|---|
| 1 | Modern Robotics; notebook robotics book; ROS tutorials | **Frames, kinematics, observations, and software messages** | A two-link arm example and a diagram of its coordinate frames. |
| 2 | Underactuated Robotics; [sampling MPC](../papers/02-mppi-control.md) | **Dynamics, feedback, costs, and receding horizon** | A simulation comparison across two controller settings. |
| 3 | [RRT*](../papers/01-rrt-star.md); [LIO-SAM](../papers/03-lio-sam.md); [ORB-SLAM3](../papers/04-orb-slam3.md) | **Planning guarantees and estimation uncertainty** | One planner experiment plus a factor-graph sketch. Read one SLAM paper deeply and skim the other. |
| 4 | Dive into Deep Learning; [ACT](../papers/06-act-aloha.md); [DROID](../papers/07-droid.md) | **Behavior cloning, action chunks, and data splits** | A dataset collection and held-out-scene evaluation plan. |
| 5 | [Diffusion Policy](../papers/05-diffusion-policy.md); Robotic Manipulation | **Multimodal actions, contact, and feedback** | A comparison of ACT and Diffusion Policy, including compute and horizon choices. |
| 6 | [OpenVLA](../papers/08-openvla.md); [SmolVLA](../papers/12-smolvla.md); skim [π0.5](../papers/11-pi05.md) | **Transfer learning, action representations, and adaptation** | A table comparing inputs, outputs, training data, and deployment requirements. |
| 7 | [TD-MPC2](../papers/09-td-mpc2.md); [DreamerV3](../papers/10-dreamerv3.md); skim [Depth Anything 3](../papers/13-depth-anything3.md) | **Learned models and what they predict** | A diagram contrasting latent planning, imagined policy learning, and geometric inference. |
| 8 | [Xiaomi-Robotics-0](../papers/14-xiaomi-robotics0.md); [2026 data survey](../papers/15-vla-data-survey.md) | **Timing, generalization, and experimental validity** | A one-page mini-project proposal with a baseline, held-out test, compute budget, and one ablation. |

## A repeatable weekly routine

1. Spend 15–20 minutes on one magazine article.
2. Spend 30 minutes screening a paper: abstract, system figure, results, and limitations.
3. Spend 60–90 minutes on the core method, recording unfamiliar prerequisites.
4. Use the remaining time for an exercise and a short note in the reading log.

## How to decide what you understand

You should be able to explain the inputs and outputs, derive or interpret the main objective, identify the baseline, and describe at least one failure mode. If you cannot, write the gap as a concrete question and revisit the relevant foundation resource.

For a mini-project, prefer a question you can test within your available compute and data. Good starting questions include chunk length versus reactivity, data split versus apparent generalization, or planning budget versus control quality.
