# react

## hooks 原理
- hooks主要是用闭包来保存状态，适用链表来保存一系列的hooks
- fiber树更新时，就能从hooks中计算出最终的状态和执行相关的副作用
