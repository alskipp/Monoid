//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class LastMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Last<Int>.mempty.value == .none)
  }

  func testMappend() {
    XCTAssertTrue(Last("a") <> Last(.none) <> Last(.none) == Last("a"))
    XCTAssertTrue(Last(.none) <> Last("a") <> Last("z") == Last("z"))
    XCTAssertTrue(Last(.none) <> Last(.none) <> Last("z") == Last("z"))
    XCTAssertTrue(Last(Optional<Int>.none) <> Last(.none) <> Last(.none) == Last(.none))
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([Last("a"), Last(.none), Last(.none)]) == Last("a"))
    XCTAssertTrue(.mconcat([Last(.none), Last("a"), Last("z")]) == Last("z"))
    XCTAssertTrue(.mconcat([Last(Optional<Int>.none), Last(.none), Last(.none)]) == Last(.none))
  }

  func testDescription() {
    XCTAssertTrue(Last("a").description == "Last(\(Optional("a")))")
  }

}
