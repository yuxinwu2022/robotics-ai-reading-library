# OpenVLA: An Open-Source Vision-Language-Action Model

[Paper](https://arxiv.org/abs/2406.09246) · [Inspected full-text version](https://arxiv.org/html/2406.09246v1) · [Additional primary resource](https://openvla.github.io/)

- **Authors:** Moo Jin Kim et al.
- **Date:** 2024
- **Topic:** AI / robot foundation models
- **Level:** Intermediate → advanced
- **Reading priority:** After ACT and Diffusion Policy
- **Publication status:** Research paper; arXiv version linked, acceptance venue not separately checked.
- **Checked:** 2026-10-05 (America/Chicago)

## Summary

OpenVLA adapts a pretrained vision-language model into an action-prediction policy. Its original 7B model uses visual features, a language-model backbone, and discretized robot action tokens, trained on a curated cross-robot demonstration mixture. The work also explores efficient adaptation to new robot settings.

## Important parts to learn

- **MUST LEARN: how continuous control becomes discrete tokens.**
- **MUST LEARN: action normalization, dataset mixtures, and transfer learning.**
- **ADVANCED: parameter-efficient fine-tuning and quantization.**

## Where to focus your reading

Sections 3.2–3.5 for training and data choices; inspect adaptation experiments and their evaluation tasks.

**Prerequisites:** Transformers, tokenization, behavior cloning, and pretrained-model fine-tuning.

## Small exercise — suggested, not executed

Quantize a one-dimensional continuous action into bins and reconstruct it. Measure quantization error and inspect how outliers affect the range. Sketch an image → tokens → actions pipeline.

## Critical reading

My assessment: action-token accuracy is an incomplete proxy for closed-loop success. Check control conventions, prompt grounding, and latency on the intended platform.

These are selective study notes, not a reproduction or comprehensive review of the paper. Teaching priorities and exercises are editorial recommendations. Publication status refers to what was verified in this edition.

[Back to paper index](index.md)
