//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class OrderingTests: XCTestCase {

  func testOrderingIsComparable() {
    XCTAssertTrue(Ordering.less < Ordering.equal)
    XCTAssertTrue(Ordering.less < Ordering.greater)

    XCTAssertTrue(Ordering.equal > Ordering.less)
    XCTAssertTrue(Ordering.equal < Ordering.greater)

    XCTAssertTrue(Ordering.greater > Ordering.less)
    XCTAssertTrue(Ordering.greater > Ordering.equal)

    XCTAssertFalse(Ordering.equal > Ordering.equal)
  }

  func testOrderingIsEquatable() {
    XCTAssertTrue(Ordering.equal == Ordering.equal)
    XCTAssertTrue(Ordering.less == Ordering.less)
    XCTAssertTrue(Ordering.greater == Ordering.greater)
  }
  
}
