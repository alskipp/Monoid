//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class OrderingSortTests: XCTestCase {

  struct PersonData {
    let name: String, age: Int, height: Double, weight: Double
  }

  let records = [
    PersonData(name: "Fred", age: 50, height: 170, weight: 65),
    PersonData(name: "Jane", age: 50, height: 170, weight: 52),
    PersonData(name: "Nora", age: 30, height: 180, weight: 65),
    PersonData(name: "Paul", age: 34, height: 100, weight: 50),
    PersonData(name: "Jill", age: 11, height: 105, weight: 35),
    PersonData(name: "Bill", age: 10, height: 105, weight: 35)
  ]


  func testCurriedCompare1() {
    let strings = ["umbrella", "a", "fish", "dog", "mouse"]
    let lengthSorted = ["a", "dog", "fish", "mouse", "umbrella"]
    let sortStringsBylength = strings.sortBy(comparing { $0.characters.count })

    XCTAssertTrue(sortStringsBylength == lengthSorted)
  }

  func testCurriedCompare2() {
    let nameSortedNames = ["Bill", "Fred", "Jane", "Jill", "Nora", "Paul"]
    let nameSorted = records.sortBy(comparing { $0.name }).map { $0.name }

    XCTAssertTrue(nameSorted == nameSortedNames)
  }


  func testMonoidCompare1() {
    let strings = ["umbrella", "house", "cat", "dog", "mouse"]
    let lengthAlphabeticalSorted = ["cat", "dog", "house", "mouse", "umbrella"]

    let lengthAlphabeticalCompare = strings.sortBy { x, y in
      comparing(x, y) { $0.characters.count } <>
      comparing(x, y) { $0 }
    }

    XCTAssertTrue(lengthAlphabeticalCompare == lengthAlphabeticalSorted)
  }

  func testMonoidCompare2() {
    let ageNameSorted = ["Bill", "Jill", "Nora", "Paul", "Fred", "Jane"]

    let ageNameCompare = records.sortBy { x, y in
      comparing(x, y) { $0.age } <>
      comparing(x, y) { $0.name }
    }.map { $0.name }

    XCTAssertTrue(ageNameCompare == ageNameSorted)
  }

  func testMonoidCompare3() {
    let heightWeightAgeSorted = ["Paul", "Bill", "Jill", "Jane", "Fred", "Nora"]

    let heightWeightAgeCompare = records.sortBy { x, y in
      comparing(x, y) { $0.height } <>
      comparing(x, y) { $0.weight } <>
      comparing(x, y) { $0.age }
    }.map { $0.name }

    XCTAssertTrue(heightWeightAgeCompare == heightWeightAgeSorted)
  }
  
}
