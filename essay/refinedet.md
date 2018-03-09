# single-shot refinement neural network for object detection

## one-stage相对于two-stage的问题
1. 训练数据类别不平衡问题，解决方法有Focal Loss、引入objectness prior constraint
2. 使用two step cascade 来回归位置
3. 使用two-stage来描述目标，第一阶段区分前景背景，第二阶段区分目标类别(也包括了前景背景的类别)。