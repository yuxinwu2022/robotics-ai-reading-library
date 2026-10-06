# Foundations and courses

These eight resources support different entry points. Priority and exercises are my recommendations. A first pass need not cover every chapter. Checked 2026-10-05.

| Resource | Level / prerequisites | Summary | Important parts to learn | First useful output |
|---|---|---|---|---|
| [Modern Robotics — Lynch and Park](https://modernrobotics.northwestern.edu/) | Beginner → intermediate; linear algebra, calculus | A structured robotics textbook with supporting videos and software resources | **Rigid transforms, twists, forward/inverse kinematics, Jacobians**, then dynamics and motion planning | Implement forward kinematics for a planar two-link arm; check against a hand calculation. |
| [Introduction to Robotics and Perception — Dellaert and Hutchinson](https://www.roboticsbook.org/) | Beginner → intermediate; Python, basic probability | An introductory robotics text using executable notebooks | **State representations, sensor models, probability, estimation, planning**, and learning | Modify a notebook's noise assumptions and explain the resulting estimate. |
| [Dive into Deep Learning](https://d2l.ai/) | Beginner → intermediate; Python and basic calculus | A practical deep-learning book that connects explanations with executable examples | **Autograd, optimization, train/validation/test separation**, CNNs and attention | Train a small model and explain overfitting using a held-out set. |
| [ROS 2 official tutorials](https://docs.ros.org/en/jazzy/Tutorials.html) | Beginner → intermediate; Python or C++ | Step-by-step introduction to robot software communication and tools | **Nodes, topics, services, actions, parameters, launch files, and transforms** | Build a publisher/subscriber example and record/replay its data. Use documentation matching your lab's ROS distribution. |
| [Underactuated Robotics — MIT / Russ Tedrake](https://underactuated.mit.edu/) | Intermediate → advanced; dynamics, calculus, linear algebra | Course notes on nonlinear dynamics, control, and optimization | **State-space models, linearization, LQR, trajectory optimization, and stability** | Derive a pendulum model and compare a local stabilizer with a swing-up strategy. |
| [Robotic Manipulation — MIT / Russ Tedrake](https://manipulation.mit.edu/) | Intermediate → advanced; kinematics, probability | Course notes connecting perception, planning, and contact-rich manipulation | **Pose estimation, grasping, collision checking, contact mechanics**, and manipulation planning | Draw a perception-to-grasp pipeline and identify uncertainty at each stage. |
| [Deep Learning — Goodfellow, Bengio, and Courville](https://www.deeplearningbook.org/) | Intermediate → advanced; probability and calculus | A theoretical reference for core deep learning | **Probability, optimization, regularization, and representation learning** | Derive a loss gradient; use the book to clarify a concept encountered in a paper. |
| [Hugging Face Robotics Course](https://huggingface.co/learn/robotics-course/en/unit0/1) | Beginner practical entry → intermediate; Python | A practical route into robot learning with the LeRobot ecosystem | **Calibration, teleoperation, datasets, training, and evaluation** | Inspect one dataset and describe its observations, actions, timestamps, and episode boundaries. |

## A sensible prerequisite order

**Geometry and coding:** linear algebra → rigid transforms → kinematics → ROS communication and simulation.

**Estimation:** probability → sensor models → Bayesian estimation / least squares → factor graphs → SLAM.

**Learning:** Python → supervised learning → neural networks → behavior cloning → ACT / Diffusion Policy → VLAs.

**Control and RL:** dynamical systems → feedback control → MPC → Bellman equations / actor–critic → TD-MPC2 / DreamerV3.

You can study these paths in parallel. For a balanced start, spend some time on physical models and geometry even when your main interest is AI.

The ROS site presented an automated-access challenge during checking; its tutorial URL is supported by Open Robotics' [official Jazzy announcement](https://discourse.ros.org/t/ros-2-jazzy-jalisco-released/37862). The notebook book was also checked against its [authors' repository](https://github.com/gtbook/robotics).
