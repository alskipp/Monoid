//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class ArrayMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Array<Int>.mempty == [])
  }

  func testMappend() {
    let empty: [Int] = []
    XCTAssertTrue(empty <> [] <> [] == [])
    XCTAssertTrue([] <> [] <> [1] == [1])
    XCTAssertTrue([] <> [] <> [1,2] == [1,2])

    XCTAssertTrue([] <> [1] <> [] == [1])
    XCTAssertTrue([] <> [1] <> [2] == [1,2])
    XCTAssertTrue([1] <> [2] <> [3] == [1,2,3])

    XCTAssertTrue([1] <> [2] <> [] == [1,2])
    XCTAssertTrue([] <> [1,2] <> [3] == [1,2,3])
    XCTAssertTrue([1] <> [] <> [2,3] == [1,2,3])
  }

  func testMconcat() {
    let empty: [Int] = []
    XCTAssertTrue(.mconcat([empty, [], []]) == [])
    XCTAssertTrue(.mconcat([[], [], [1]]) == [1])
    XCTAssertTrue(.mconcat([[], [], [1,2]]) == [1,2])

    XCTAssertTrue(.mconcat([[], [1], []]) == [1])
    XCTAssertTrue(.mconcat([[], [1], [2]]) == [1,2])
    XCTAssertTrue(.mconcat([[1], [2], [3]]) == [1,2,3])

    XCTAssertTrue(.mconcat([[1], [2], []]) == [1,2])
    XCTAssertTrue(.mconcat([[], [1,2], [3]]) == [1,2,3])
    XCTAssertTrue(.mconcat([[1], [], [2,3]]) == [1,2,3])
  }

  func test_single_element_Array_mconcat_Performance() {
    let nestedArray = Array(repeating: [1], count: 25_000)

    self.measure {
      _ = Array.mconcat(nestedArray)
    }
  }

  func test_large_Array_mconcat_Performance() {
    let arr = Array(repeating: 1, count: 100_000)
    let nestedArray = Array(repeating: arr, count: 10)

    self.measure {
      _ = Array.mconcat(nestedArray)
    }
  }
  
}
