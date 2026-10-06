# Paper index

15 papers with individual notes. **Dates are release/publication dates as labeled, not a claim of recency for every entry.** Checked 2026-10-05.

| Note | Year | Topic | Level | Priority |
|---|---|---|---|---|
| [Sampling-based Algorithms for Optimal Motion Planning](01-rrt-star.md) | 2011 | Planning | Intermediate → advanced | Essential |
| [Information Theoretic Model Predictive Control: Theory and Applications to Autonomous Driving](02-mppi-control.md) | 2017 | Control | Intermediate → advanced | Essential |
| [LIO-SAM: Tightly-coupled Lidar Inertial Odometry via Smoothing and Mapping](03-lio-sam.md) | 2020 | State estimation / SLAM | Intermediate → advanced | Essential |
| [ORB-SLAM3: An Accurate Open-Source Library for Visual, Visual-Inertial and Multi-Map SLAM](04-orb-slam3.md) | 2020 preprint / 2021 journal | State estimation / SLAM | Intermediate → advanced | Essential |
| [Diffusion Policy: Visuomotor Policy Learning via Action Diffusion](05-diffusion-policy.md) | 2023 / 2024 journal extension | Robot learning / manipulation | Intermediate → advanced | Essential |
| [Learning Fine-Grained Bimanual Manipulation with Low-Cost Hardware](06-act-aloha.md) | 2023 | Robot learning / manipulation | Intermediate | Essential |
| [DROID: A Large-Scale In-The-Wild Robot Manipulation Dataset](07-droid.md) | 2024 | Datasets / evaluation | Beginner overview → advanced analysis | Essential |
| [OpenVLA: An Open-Source Vision-Language-Action Model](08-openvla.md) | 2024 | AI / robot foundation models | Intermediate → advanced | After ACT and Diffusion Policy |
| [TD-MPC2: Scalable, Robust World Models for Continuous Control](09-td-mpc2.md) | 2023 initial preprint | Control / model-based RL | Advanced | After MPC and RL foundations |
| [Mastering diverse control tasks through world models](10-dreamerv3.md) | 2025 Nature publication | AI / model-based RL | Advanced | After introductory RL |
| [π0.5: a Vision-Language-Action Model with Open-World Generalization](11-pi05.md) | 2025 initial preprint | AI / generalization / manipulation | Advanced | After OpenVLA |
| [SmolVLA: A Vision-Language-Action Model for Affordable and Efficient Robotics](12-smolvla.md) | 2025 initial preprint | Practical AI / robot learning | Intermediate → advanced | High: practical entry to VLAs |
| [Depth Anything 3: Recovering the Visual Space from Any Views](13-depth-anything3.md) | 2025 initial preprint | Perception / 3D geometry / AI | Intermediate → advanced | High: bridge between geometry and AI |
| [Xiaomi-Robotics-0: An Open-Sourced Vision-Language-Action Model with Real-Time Execution](14-xiaomi-robotics0.md) | 2026 initial preprint | AI / deployment / manipulation | Advanced | Recent research: read after SmolVLA |
| [Vision-Language-Action in Robotics: A Survey of Datasets, Benchmarks, and Data Engines](15-vla-data-survey.md) | 2026 initial preprint | Research methods / datasets / evaluation | Beginner overview → advanced research | High: research map |

## Choose a route

- **Geometry and physical systems:** RRT* → sampling MPC → LIO-SAM / ORB-SLAM3 → Depth Anything 3.
- **Learning from demonstrations:** DROID → ACT → Diffusion Policy → OpenVLA / SmolVLA.
- **Advanced AI and deployment:** TD-MPC2 / DreamerV3 → π0.5 → Xiaomi-Robotics-0 → VLA data survey.

Use the [foundation guide](../resources/foundations.md) to fill prerequisite gaps and the [reading plan](../study/learning-plan.md) to keep a balanced pace.
