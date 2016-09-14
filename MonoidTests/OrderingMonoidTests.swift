//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class OrderingMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Ordering.mempty == .equal)
  }

  func testMappend() {
    XCTAssertTrue(.equal <> .equal <> .equal == .equal)
    XCTAssertTrue(.equal <> .equal <> .less == .less)
    XCTAssertTrue(.equal <> .equal <> .greater == .greater)

    XCTAssertTrue(.equal <> .less <> .equal == .less)
    XCTAssertTrue(.equal <> .less <> .greater == .less)
    XCTAssertTrue(.less <> .greater <> .greater == .less)

    XCTAssertTrue(.greater <> .less <> .equal == .greater)
    XCTAssertTrue(.equal <> .greater <> .less == .greater)
    XCTAssertTrue(.equal <> .greater <> .equal == .greater)
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([.equal, .equal, .equal]) == .equal)
    XCTAssertTrue(.mconcat([.equal, .equal, .less]) == .less)
    XCTAssertTrue(.mconcat([.equal, .equal, .greater]) == .greater)

    XCTAssertTrue(.mconcat([.equal, .less, .equal]) == .less)
    XCTAssertTrue(.mconcat([.equal, .less, .greater]) == .less)
    XCTAssertTrue(.mconcat([.less, .greater, .greater]) == .less)

    XCTAssertTrue(.mconcat([.greater, .less, .equal]) == .greater)
    XCTAssertTrue(.mconcat([.equal, .greater, .less]) == .greater)
    XCTAssertTrue(.mconcat([.equal, .greater, .equal]) == .greater)
  }
  
}
