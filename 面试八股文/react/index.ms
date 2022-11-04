# react

## hooks 原理
- hooks主要是用闭包来保存状态，适用链表来保存一系列的hooks
- fiber树更新时，就能从hooks中计算出最终的状态和执行相关的副作用

## react 事件
- react 使用的事件是模仿浏览器原生事件原理实现的虚拟事件。包括事件的注册，事件的合成， 事件的冒泡，事件的派发。
- 原生事件的触发发生在捕获阶段，react事件发生在冒泡阶段。所以，如果阻止原生事件冒泡会影响后续的react事件，但是阻止react合成事件冒泡，不会影响react的原生事件的触发。
- react 17之前事件react事件挂载在document上，react17之后挂载到 render dom上，为了适配微前端技术
- react 合成事件 onChange 事件聚合了 blur change input keydown keyup 等原生事件
- react16 有事件池对象， 想要保持对绑定dom的引用必须使用 e.persist()

## react Fiber
- 如何查看Fiber对象，在渲染的节点上右键选择"store as global variable", 可以在console栏中赋值给temp1变量，使用 `tem1.__reactFiber$10thy90iwcqr` 可以查看Fiber对象
- Fiber 对象包含的属性
  - tag 表示fiber 节点的类型，是使用枚举值表示的， 例如： 0 表示 functionComponent 1表示classComponent 5表示reactDom
  - stateNode: 指向创建的真实dom对象
  - type: DOMElement类型
  - memoizedProps: 节点上的props属性
  - memoizedState：
  - key  例如 "0.3410253892175561"
  - mode
  - child
 - 事件切片
  - task 持续事件长度 5ms
  
 - 事件优先级
  -
