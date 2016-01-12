# Monoid

[![Build Status](https://travis-ci.org/alskipp/Monoid.svg?branch=master)](https://travis-ci.org/alskipp/Monoid)

An implementation of Monoids in Swift. I'll add more explanation at some point, but for now, let's jump straight to a practical example: Sorting.

Take a look at the data structure below. (If you're keen to test out the code, there's a Playground included with the project).

```swift
struct PersonData {
  let name: String, age: Int, height: Double, weight: Double
}

let records = [
  PersonData(name: "Fred", age: 50, height: 170, weight: 65),
  PersonData(name: "Jane", age: 50, height: 170, weight: 52),
  PersonData(name: "Nora", age: 30, height: 180, weight: 65),
  PersonData(name: "Paul", age: 34, height: 100, weight: 50),
  PersonData(name: "Gill", age: 10, height: 105, weight: 35), // identical twins
  PersonData(name: "Bill", age: 10, height: 105, weight: 35)  // identical twins
]
```

The challenge is to sort an Array of this data by multiple properties. 
Sort first by, `height` then `weight` then `age` then `name`.

Here's how it looks using the `Ordering` Monoid:

```swift
let sortedRecords = records.sortBy { x, y in
  comparing(x, y) { $0.height } <>
  comparing(x, y) { $0.weight } <>
  comparing(x, y) { $0.age } <>
  comparing(x, y) { $0.name }
}
```

And here's a version without:

```swift
let sortedRecords2 = records.sort { x, y in
  if x.height == y.height {
    if x.weight == y.weight {
      if x.age == y.age {
        return x.name < y.name
      } else {
        return x.age < y.age
      }
    } else {
      return x.weight < y.weight
    }
  } else {
    return x.height < y.height
  }
}
```

There are many more Monoids defined in the project with examples in the Xcode Playground file, so please take a look.

## Current limitations

Using Swift 2, it is not possible to define various Monoids. Such as:

```swift
extension Optional: Monoid where Wrapped: Monoid {}
error: extension of type 'Optional' with constraints cannot have an inheritance clause
```

Which is the same restriction that prevents making Array Equatable with:

```swift
extension Array: Equatable where Element: Equatable {}
```

There's a good chance that this will be possible with Swift 3. 😊

Another limitation is the inability to extend Tuples, though whether this limitation will be removed in Swift 3, I'm not sure. Despite these current limitations I think it's still worth while just to get the `Ordering` Monoid.
