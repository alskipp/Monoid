//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class OrderingMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Ordering.mempty == .eq)
  }

  func testMappend() {
    XCTAssertTrue(.eq <> .eq <> .eq == .eq)
    XCTAssertTrue(.eq <> .eq <> .lt == .lt)
    XCTAssertTrue(.eq <> .eq <> .gt == .gt)

    XCTAssertTrue(.eq <> .lt <> .eq == .lt)
    XCTAssertTrue(.eq <> .lt <> .gt == .lt)
    XCTAssertTrue(.lt <> .gt <> .gt == .lt)

    XCTAssertTrue(.gt <> .lt <> .eq == .gt)
    XCTAssertTrue(.eq <> .gt <> .lt == .gt)
    XCTAssertTrue(.eq <> .gt <> .eq == .gt)
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([.eq, .eq, .eq]) == .eq)
    XCTAssertTrue(.mconcat([.eq, .eq, .lt]) == .lt)
    XCTAssertTrue(.mconcat([.eq, .eq, .gt]) == .gt)

    XCTAssertTrue(.mconcat([.eq, .lt, .eq]) == .lt)
    XCTAssertTrue(.mconcat([.eq, .lt, .gt]) == .lt)
    XCTAssertTrue(.mconcat([.lt, .gt, .gt]) == .lt)

    XCTAssertTrue(.mconcat([.gt, .lt, .eq]) == .gt)
    XCTAssertTrue(.mconcat([.eq, .gt, .lt]) == .gt)
    XCTAssertTrue(.mconcat([.eq, .gt, .eq]) == .gt)
  }
  
}
