//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class OrderingTests: XCTestCase {

  func testOrderingIsComparable() {
    XCTAssertTrue(Ordering.lt < Ordering.eq)
    XCTAssertTrue(Ordering.lt < Ordering.gt)

    XCTAssertTrue(Ordering.eq > Ordering.lt)
    XCTAssertTrue(Ordering.eq < Ordering.gt)

    XCTAssertTrue(Ordering.gt > Ordering.lt)
    XCTAssertTrue(Ordering.gt > Ordering.eq)

    XCTAssertFalse(Ordering.eq > Ordering.eq)
  }

  func testOrderingIsEquatable() {
    XCTAssertTrue(Ordering.eq == Ordering.eq)
    XCTAssertTrue(Ordering.lt == Ordering.lt)
    XCTAssertTrue(Ordering.gt == Ordering.gt)
  }
  
}
