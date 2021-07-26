# typescript 基础

## 关键字

* interface（接口）
* type 组合

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

