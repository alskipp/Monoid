//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

// Ensure `Orderable` protocol conformance gives correct implementation of `compare` function.

enum Foo: Equatable, Comparable, Orderable { case a, b, c }

// `Comparable` must be defined manually
func < (x: Foo, y: Foo) -> Bool {
  switch (x, y) {
  case (.a, .b), (.a, .c), (.b, .c): return true
  default: return false
  }
}

class OrderableTests: XCTestCase {

  func testOrderableOrdering() {
    XCTAssert(Ordering.lt.compare(.lt) == .eq)
    XCTAssert(Ordering.lt.compare(.gt) == .lt)
    XCTAssert(Ordering.lt.compare(.eq) == .lt)

    XCTAssert(Ordering.eq.compare(.lt) == .gt)
    XCTAssert(Ordering.eq.compare(.eq) == .eq)
    XCTAssert(Ordering.eq.compare(.gt) == .lt)

    XCTAssert(Ordering.gt.compare(.lt) == .gt)
    XCTAssert(Ordering.gt.compare(.eq) == .gt)
    XCTAssert(Ordering.gt.compare(.gt) == .eq)
  }

  func testFooOrderableCompare() {
    XCTAssert(Foo.a.compare(Foo.a) == .eq)
    XCTAssert(Foo.b.compare(Foo.b) == .eq)
    XCTAssert(Foo.c.compare(Foo.c) == .eq)

    XCTAssert(Foo.a.compare(Foo.b) == .lt)
    XCTAssert(Foo.a.compare(Foo.c) == .lt)
    XCTAssert(Foo.b.compare(Foo.c) == .lt)

    XCTAssert(Foo.b.compare(Foo.a) == .gt)
    XCTAssert(Foo.c.compare(Foo.a) == .gt)
    XCTAssert(Foo.c.compare(Foo.b) == .gt)
  }

  func testBoolCompare() {
    XCTAssert(false.compare(true) == .lt)
    XCTAssert(false.compare(false) == .eq)
    XCTAssert(true.compare(false) == .gt)
  }
  
}
