//
//  OrderingTests.swift
//  Monoid
//
//  Created by Alan Skipp on 29/12/2015.
//  Copyright © 2015 Al Skipp. All rights reserved.
//

import XCTest
import Monoid

class OrderingTests: XCTestCase {

  func testOrderingIsComparable() {
    XCTAssertTrue(Ordering.LT < Ordering.EQ)
    XCTAssertTrue(Ordering.LT < Ordering.GT)

    XCTAssertTrue(Ordering.EQ > Ordering.LT)
    XCTAssertTrue(Ordering.EQ < Ordering.GT)
    
    XCTAssertTrue(Ordering.GT > Ordering.LT)
    XCTAssertTrue(Ordering.GT > Ordering.EQ)
    
    XCTAssertFalse(Ordering.EQ > Ordering.EQ)
  }

  func testOrderingIsEquatable() {
    XCTAssertTrue(Ordering.EQ == Ordering.EQ)
    XCTAssertTrue(Ordering.LT == Ordering.LT)
    XCTAssertTrue(Ordering.GT == Ordering.GT)
  }
  
}
