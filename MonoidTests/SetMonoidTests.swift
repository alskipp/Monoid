//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class SetMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Set<Int>.mempty == Set())
  }

  func testMappend() {
    let empty: Set<Int> = Set()
    XCTAssertTrue(empty <> Set() <> Set() == Set())
    XCTAssertTrue(empty <> Set([1,2]) <> Set([3]) == Set([1,2,3]))
    XCTAssertTrue(Set<Int>([1]) <> Set([1]) <> Set([2]) == Set([1,2]))
  }

  func testMconcat() {
    let empty: Set<Int> = Set()
    XCTAssertTrue(.mconcat([empty, Set(), Set()]) == Set())
    XCTAssertTrue(.mconcat([empty, Set([1,2]), Set([3])]) == Set([1,2,3]))
    XCTAssertTrue(.mconcat([Set<Int>([1]), Set([1]), Set([2])]) == Set([1,2]))
  }

  func test_single_element_Set_mconcat_Performance() {
    let sets = Array(count: 10_000, repeatedValue: Set<Int>([1]))

    self.measureBlock {
      Set.mconcat(sets)
    }
  }

  func test_Set_mconcat_Performance() {
    let set1 = Set((1...2_000))
    let set2 = Set((1_000...3_000))
    let set3 = Set((2_000...4_000))
    let set4 = Set((3_000...5_000))

    let sets = [set1, set2, set3, set4]

    self.measureBlock {
      Set.mconcat(sets)
    }
  }
  
}
