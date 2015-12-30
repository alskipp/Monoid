//
//  OrderingMonoidTests.swift
//  Monoid
//
//  Created by Alan Skipp on 30/12/2015.
//  Copyright © 2015 Al Skipp. All rights reserved.
//

import XCTest
import Monoid

class OrderingMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Ordering.mempty == .EQ)
  }
  
  func testMappend() {
    XCTAssertTrue(.EQ <> .EQ <> .EQ == .EQ)
    XCTAssertTrue(.EQ <> .EQ <> .LT == .LT)
    XCTAssertTrue(.EQ <> .EQ <> .GT == .GT)
    
    XCTAssertTrue(.EQ <> .LT <> .EQ == .LT)
    XCTAssertTrue(.EQ <> .LT <> .GT == .LT)
    XCTAssertTrue(.LT <> .GT <> .GT == .LT)

    XCTAssertTrue(.GT <> .LT <> .EQ == .GT)
    XCTAssertTrue(.EQ <> .GT <> .LT == .GT)
    XCTAssertTrue(.EQ <> .GT <> .EQ == .GT)
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([.EQ, .EQ, .EQ]) == .EQ)
    XCTAssertTrue(.mconcat([.EQ, .EQ, .LT]) == .LT)
    XCTAssertTrue(.mconcat([.EQ, .EQ, .GT]) == .GT)
    
    XCTAssertTrue(.mconcat([.EQ, .LT, .EQ]) == .LT)
    XCTAssertTrue(.mconcat([.EQ, .LT, .GT]) == .LT)
    XCTAssertTrue(.mconcat([.LT, .GT, .GT]) == .LT)
    
    XCTAssertTrue(.mconcat([.GT, .LT, .EQ]) == .GT)
    XCTAssertTrue(.mconcat([.EQ, .GT, .LT]) == .GT)
    XCTAssertTrue(.mconcat([.EQ, .GT, .EQ]) == .GT)
  }
  
}
