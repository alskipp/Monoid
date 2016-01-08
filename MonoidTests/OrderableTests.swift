//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

// Ensure `Orderable` protocol conformance gives correct implementation of `compare` function.

enum Foo: Equatable, Comparable, Orderable { case A, B, C }

// `Comparable` must be defined manually
func < (x: Foo, y: Foo) -> Bool {
  switch (x, y) {
  case (.A, .B), (.A, .C), (.B, .C): return true
  default: return false
  }
}

class OrderableTests: XCTestCase {

  func testOrderableOrdering() {
    XCTAssert(Ordering.LT.compare(.LT) == .EQ)
    XCTAssert(Ordering.LT.compare(.GT) == .LT)
    XCTAssert(Ordering.LT.compare(.EQ) == .LT)

    XCTAssert(Ordering.EQ.compare(.LT) == .GT)
    XCTAssert(Ordering.EQ.compare(.EQ) == .EQ)
    XCTAssert(Ordering.EQ.compare(.GT) == .LT)

    XCTAssert(Ordering.GT.compare(.LT) == .GT)
    XCTAssert(Ordering.GT.compare(.EQ) == .GT)
    XCTAssert(Ordering.GT.compare(.GT) == .EQ)
  }

  func testFooOrderableCompare() {
    XCTAssert(Foo.A.compare(Foo.A) == .EQ)
    XCTAssert(Foo.B.compare(Foo.B) == .EQ)
    XCTAssert(Foo.C.compare(Foo.C) == .EQ)

    XCTAssert(Foo.A.compare(Foo.B) == .LT)
    XCTAssert(Foo.A.compare(Foo.C) == .LT)
    XCTAssert(Foo.B.compare(Foo.C) == .LT)

    XCTAssert(Foo.B.compare(Foo.A) == .GT)
    XCTAssert(Foo.C.compare(Foo.A) == .GT)
    XCTAssert(Foo.C.compare(Foo.B) == .GT)
  }

  func testBoolCompare() {
    XCTAssert(false.compare(true) == .LT)
    XCTAssert(false.compare(false) == .EQ)
    XCTAssert(true.compare(false) == .GT)
  }
  
}
