//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class FirstMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(First<Int>.mempty.value == .None)
  }

  func testMappend() {
    XCTAssertTrue(First("a") <> First(.None) <> First(.None) == First("a"))
    XCTAssertTrue(First(.None) <> First("a") <> First("z") == First("a"))
    XCTAssertTrue(First(.None) <> First(.None) <> First("z") == First("z"))
    XCTAssertTrue(First(Optional<Int>.None) <> First(.None) <> First(.None) == First(.None))
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([First("a"), First(.None), First(.None)]) == First("a"))
    XCTAssertTrue(.mconcat([First(.None), First("a"), First("z")]) == First("a"))
    XCTAssertTrue(.mconcat([First(Optional<Int>.None), First(.None), First(.None)]) == First(.None))
  }

  func testDescription() {
    XCTAssertTrue(First("a").description == "First(\(Optional("a")))")
  }

}
