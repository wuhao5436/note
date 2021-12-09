# typescript 基础


## 文章关键字
* 范型
* interface（接口）
* type 组合
* `keyof` `typeof`关键字

## 范型
* 范型是一种**抽象共性**的编程手段，他允许将类型作为其他类型的参数，从而起到“关注点分离”的作用。
* 范型约束 
```
// 示例1 约束范型具有length属性
interface LengthProps {
  length: number
}
<T extends LengthProps> () { }

// 示例2 解析对象
function getProps<Type, Key extends keyof Type>(obj: Type, key: Key) {
 return obj[key];
}
let x = {a: 1, b: '2'}
getProps(x, 'a') = 1
// getProps(x, 'm') ts 报错

```
* 示例化范型类型（将类作为参数）
```
function create<Type>(c: new (): Type): Type {
  return new c();
}
// new (): Type 特殊描述
```
##  interface 和 type 的区别

### 概念

- interface 接口 类似于其他语言
- type 类型别名 就是多个类型的组合

###  示例

继承的概念的示例

```typescript
interface Animal {
  live: boolean;
  legs: 4;
}


interface Bee extends Animal {
  canFly: boolean;
}

interface Horse extends Animal {
  canRun: boolean;
  canRide: boolean;
}
```

type 的示例的概念 

```typescript
type flyAble = (animal: string) => boolean;
type rideAble = (animal: string) => boolean;
type runFastAble = (animal: string) => boolean;

type beeLikeType = Animal & flyAble;
type horseLikeType = Animal & rideAble & runFastAble;
```

 现代编程 继承的观念比重在下降，因为会造成代码臃肿，

 现在流行的观念叫做：<b style="background: yellow">**关注点分离**</b>

 所以组合的类型要比继承的类型跟清晰，不过不是说一定要尽量使用组合，还是要看具体的环境

 特性 interface 可以多次申明，多次申明相互会组合起来使用

```typescript
interface Animal {
  weight: number;
}

interface Animal {
 size: "big" | "small"
}

const chineseBee: Animal = {
  live: true,
  legs: 4,
  weight: 0.001,
  size: 'small'
}
```

## typeof(类型守卫)和 keyof（类型窄化）

### typeof 的作用
- 窄化的本质是重新定义类型，解决联合类型的窄化
- 在严格类型的语言typeof中，使用typeof会使得子block的值型发生变化，类型发生窄化
- ! 真值窄化 会过更好应对 null undefined 0 
- 相等性窄化
- in操作符窄化 "a" in {a: 1}
- instanceof 窄化. date instanceof Date
- 组合类型推导 x = a ? 1 : '1'
- 判别的联合窄化
```typescript
// 例子1：
interface Shape {
  type: 'circle' | 'square';
  length?: number;
  radius: number;
}
funtion getArea (item: Shape) {
  if (item.type === 'circle') {
    // 很丑，类型没有发生窄化
    return 3.14 * item.radius! ** 2 
  } else {
    ....
  }
}
// 例子2:
interface CircleShape {
  type: 'circle';
  radius: number;
}

interface SquareShape {
  type: 'square';
  lenght: number
}

type Shape = CircleShape | SquareShape;

function getArea (item: Shape) {
 if (item.type === 'circle') {
    // 通过ts校验，不会再报错 
    return 3.14 * item.radiu ** 2 
  } else {
    ....
  }
}
```
### keyof 的作用

Keyof写在一个type前面返回一个type

```typescript
type breakFristPrice = {
    milk: 2,
    bread: 1,
    egg: 1.5,
}
// 返回 type breakFirstTypes = "milk"|"bread"|"egg"
type breakFirstTypes =  keyof breakFristPrice;

function custormerAskForBreakFirst (someThingToEat : breakFirstTypes) { return someThingToEat}

custormerAskForBreakFirst('milk');
custormerAskForBreakFirst('egg');
custormerAskForBreakFirst('beaf'); // 报错
custormerAskForBreakFirst(undefined);
custormerAskForBreakFirst(null);

```

