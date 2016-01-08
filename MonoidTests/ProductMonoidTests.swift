//
//  ProductMonoidTests.swift
//  Monoid
//
//  Created by Alan Skipp on 08/01/2016.
//  Copyright © 2016 Al Skipp. All rights reserved.
//

import XCTest
import Monoid

class ProductMonoidTests: XCTestCase {
  
  func testMempty() {
    XCTAssertTrue(Product<Int>.mempty.value == 1)
    XCTAssertTrue(Product<Double>.mempty.value == 1)
    XCTAssertTrue(Product<Int8>.mempty.value == 1)
  }
  
  func testMappend() {
    XCTAssertTrue(Product<Int>(2) <> Product(2) <> Product(2) == Product(8))
    XCTAssertTrue(Product<Int>(0) <> Product(5) <> Product(0) == Product(0))
    XCTAssertTrue(Product<Int>(1) <> Product(5) <> Product.mempty == Product(5))
    XCTAssertTrue(Product<Int>(0) <> Product(0) <> Product(0) < Product(1))
    XCTAssertTrue(Product<Int>(1) <> Product(1) <> Product(1) == Product.mempty)
  }
  
  func testMconcat() {
    XCTAssertTrue(.mconcat([Product<Int>(2), Product(2), Product(2)]) == Product(8))
    XCTAssertTrue(.mconcat([Product<Int>(5), Product(17), Product(0)]) == Product(0))
    XCTAssertTrue(.mconcat([Product<Int>(1), Product(1), Product(3)]) == Product(3))
    XCTAssertTrue(.mconcat([Product<Int>(1), Product(1), Product(1)]) == Product.mempty)
  }
  
  func testDescription() {
    XCTAssertTrue(Product(1).description == "Product(1)")
  }
  
}
