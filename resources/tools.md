# Practical tools to connect reading with experiments

Checked 2026-10-05. Use the official documentation that matches the version you install. These are study recommendations, not claims that environments have been installed or experiments reproduced.

| Tool | Useful for | Important parts to learn | Small starting task |
|---|---|---|---|
| [MuJoCo](https://mujoco.readthedocs.io/en/stable/overview.html) | Dynamics, contacts, simulated control and RL | **Model versus state data, timestep, actuators, contacts, and controller frequency** | Simulate a pendulum and compare trajectories under two timesteps. |
| [LeRobot](https://github.com/huggingface/lerobot) | Demonstration datasets, policy training and evaluation | **Observation/action schema, episode boundaries, normalization, and rollout evaluation** | Inspect a small dataset and locate image, state, and action fields before training. |
| [MoveIt 2](https://moveit.picknik.ai/main/index.html) | Manipulator motion planning and robot software integration | **Robot models, planning scenes, collision checking, IK, and trajectory execution** | Follow an official simulation tutorial and explain why one proposed motion is rejected. |
| [Nav2](https://docs.nav2.org/) | Mobile-robot navigation | **Localization, costmaps, global planning, local control, and recovery behavior** | Read the getting-started material and draw the navigation pipeline. Its entry URL returned only a redirect during verification. |
| [ROS 2 tutorials](https://docs.ros.org/en/jazzy/Tutorials.html) | Communication, configuration, and reproducible robot software | **Topics versus services versus actions; timestamps and coordinate frames** | Record a short message stream and replay it while inspecting timing. |

## Before reproducing a paper

Record the exact code revision, environment versions, data split, seeds, hardware, and evaluation protocol. Choose a small subset first. Report success or error metrics together with runtime and failure frequency.

**A good first project:** implement a simple controller or planner in simulation, evaluate it across multiple starts, and add one change supported by an ablation. This gives you a stronger basis for reading claims about larger models.
