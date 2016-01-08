//
//  MaxMonoidTests.swift
//  Monoid
//
//  Created by Alan Skipp on 08/01/2016.
//  Copyright © 2016 Al Skipp. All rights reserved.
//

import XCTest
import Monoid

class MaxMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Max<Int>.mempty.value == .None)
  }
  
  func testMappend() {
    XCTAssertTrue(Max("a") <> Max(.None) <> Max(.None) == Max("a"))
    XCTAssertTrue(Max(.None) <> Max("a") <> Max("z") == Max("z"))
    XCTAssertTrue(Max(.None) <> Max(.None) <> Max("z") == Max("z"))
    XCTAssertTrue(Max(Optional<Int>.None) <> Max(.None) <> Max(.None) == Max(.None))
  }
  
  func testMconcat() {
    XCTAssertTrue(.mconcat([Max("a"), Max(.None), Max(.None)]) == Max("a"))
    XCTAssertTrue(.mconcat([Max(.None), Max("a"), Max("z")]) == Max("z"))
    XCTAssertTrue(.mconcat([Max(Optional<Int>.None), Max(.None), Max(.None)]) == Max(.None))
  }
  
  func testComparable() {
    XCTAssertTrue(Max("a") < Max("b"))
    XCTAssertTrue(Max(.None) < Max("a"))
  }
  
  func testDescription() {
    XCTAssertTrue(Max("a").description == "Max(\(Optional("a")))")
  }

}
