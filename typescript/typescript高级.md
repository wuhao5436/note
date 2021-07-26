# typescript 高级

## 关键字

- infer‘

## infer

`infer` 的作用在于作用在于解析嵌套结构中的数据类型

如下例子中定义type FlattenType 是一种推到类型，可以理解成typescript的一种函数，传入一个范型T，或者是T的多层嵌套数组，返回一个T类型，V其实是我不关心的一种类型，V是留个typescript推导的一个类型。我只要知道V[]是一个可以继续解析的类型，要取到最后的T才算成功。

```typescript
type FlattenType<T> =  T extends (infer V)[]? FlattenType<V> : T;

type D = FlattenType<number>
type E = FlattenType<number[]>
type F = FlattenType<number[][]>

function flatten1<T extends Array<any>> (params: T ): Array<FlattenType<T>> {
  return ( new Array<FlattenType<T>>())
  .concat(
    ...params.map(x => Array.isArray(x)?flatten1(x): x )
  )
}
```

