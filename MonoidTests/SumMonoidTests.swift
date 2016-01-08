//
//  SumMonoidTests.swift
//  Monoid
//
//  Created by Alan Skipp on 30/12/2015.
//  Copyright © 2015 Al Skipp. All rights reserved.
//

import XCTest
import Monoid

class SumMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Sum<Int>.mempty.value == 0)
    XCTAssertTrue(Sum<Double>.mempty.value == 0)
    XCTAssertTrue(Sum<Int8>.mempty.value == 0)
  }
  
  func testMappend() {
    XCTAssertTrue(Sum<Int>(2) <> Sum(2) <> Sum(2) == Sum(6))
    XCTAssertTrue(Sum<Int>(0) <> Sum(5) <> Sum.mempty == Sum(5))
    XCTAssertTrue(Sum<Int>(0) <> Sum(0) <> Sum(0) < Sum(1))
  }
  
  func testMconcat() {
    XCTAssertTrue(.mconcat([Sum<Int>(2), Sum(2), Sum(2)]) == Sum(6))
    XCTAssertTrue(.mconcat([Sum<Int>(0), Sum(5), Sum(0)]) == Sum(5))
    XCTAssertTrue(.mconcat([Sum<Int>(0), Sum(0), Sum(0)]) == Sum.mempty)
  }

  func testDescription() {
    XCTAssertTrue(Sum(1).description == "Sum(1)")
  }
  
}
