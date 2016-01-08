//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class NumberTypeTests: XCTestCase {

  func testZero() {
    XCTAssert(Int.zero == 0)
    XCTAssert(Int64.zero == 0)
    XCTAssert(Int32.zero == 0)
    XCTAssert(Int16.zero == 0)
    XCTAssert(Int8.zero == 0)

    XCTAssert(UInt64.zero == 0)
    XCTAssert(UInt32.zero == 0)
    XCTAssert(UInt16.zero == 0)
    XCTAssert(UInt8.zero == 0)

    XCTAssert(Double.zero == 0)
    XCTAssert(Float.zero == 0)
    XCTAssert(Float80.zero == 0)
  }

  func testOne() {
    XCTAssert(Int.one == 1)
    XCTAssert(Int64.one == 1)
    XCTAssert(Int32.one == 1)
    XCTAssert(Int16.one == 1)
    XCTAssert(Int8.one == 1)

    XCTAssert(UInt64.one == 1)
    XCTAssert(UInt32.one == 1)
    XCTAssert(UInt16.one == 1)
    XCTAssert(UInt8.one == 1)

    XCTAssert(Double.one == 1)
    XCTAssert(Float.one == 1)
    XCTAssert(Float80.one == 1)
  }
}
