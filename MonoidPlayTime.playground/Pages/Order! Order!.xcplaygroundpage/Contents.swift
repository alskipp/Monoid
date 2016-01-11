/*:
**Note:** For **Monoid** to be imported into the Playground, ensure that the **Monoid-Mac** *scheme* is selected from the list of schemes.

* * *
## Ordering Monoid
*/
import Monoid
/*:
As anything with a name from category theory beginnning with ‘M’ is likely to provoke suspicion or fear,
let’s start with a compelling practical example – sorting things.

Given a data structure with several properties, the challenge is, how to sort an Array of these items
by arbitrary properties? For example, take a look at the **PersonData** struct below.
How could we sort an Array by the following properties:

**height** -> **weight** -> **age** -> **name**

To be clear, this means, sort by height first, if the heights are identical then sort by weight, then age, then name.
*/
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
//: Sort using a friendly Ordering Monoid 🐼
let sortedRecords = records.sortBy { x, y in
  comparing(x, y) { $0.height } <>
  comparing(x, y) { $0.weight } <>
  comparing(x, y) { $0.age } <>
  comparing(x, y) { $0.name }
}

sortedRecords

//: Equivalent sorting code without a friendly Ordering Monoid 🙈
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

sortedRecords2

/*:
Now let’s say we need to sort by **name** -> **age** -> **weight** -> **height**, instead.

Which is easier to change? Give it a go.

* * *

[**Next page ->** (Show me the Monoids!)](@next)
*/
