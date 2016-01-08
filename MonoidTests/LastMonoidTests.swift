//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class LastMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Last<Int>.mempty.value == .None)
  }
  
  func testMappend() {
    XCTAssertTrue(Last("a") <> Last(.None) <> Last(.None) == Last("a"))
    XCTAssertTrue(Last(.None) <> Last("a") <> Last("z") == Last("z"))
    XCTAssertTrue(Last(.None) <> Last(.None) <> Last("z") == Last("z"))
    XCTAssertTrue(Last(Optional<Int>.None) <> Last(.None) <> Last(.None) == Last(.None))
  }
  
  func testMconcat() {
    XCTAssertTrue(.mconcat([Last("a"), Last(.None), Last(.None)]) == Last("a"))
    XCTAssertTrue(.mconcat([Last(.None), Last("a"), Last("z")]) == Last("z"))
    XCTAssertTrue(.mconcat([Last(Optional<Int>.None), Last(.None), Last(.None)]) == Last(.None))
  }
  
  func testDescription() {
    XCTAssertTrue(Last("a").description == "Last(\(Optional("a")))")
  }
  
}
