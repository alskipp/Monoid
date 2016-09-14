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
    XCTAssert(Ordering.less.compare(.less) == .equal)
    XCTAssert(Ordering.less.compare(.greater) == .less)
    XCTAssert(Ordering.less.compare(.equal) == .less)

    XCTAssert(Ordering.equal.compare(.less) == .greater)
    XCTAssert(Ordering.equal.compare(.equal) == .equal)
    XCTAssert(Ordering.equal.compare(.greater) == .less)

    XCTAssert(Ordering.greater.compare(.less) == .greater)
    XCTAssert(Ordering.greater.compare(.equal) == .greater)
    XCTAssert(Ordering.greater.compare(.greater) == .equal)
  }

  func testFooOrderableCompare() {
    XCTAssert(Foo.a.compare(Foo.a) == .equal)
    XCTAssert(Foo.b.compare(Foo.b) == .equal)
    XCTAssert(Foo.c.compare(Foo.c) == .equal)

    XCTAssert(Foo.a.compare(Foo.b) == .less)
    XCTAssert(Foo.a.compare(Foo.c) == .less)
    XCTAssert(Foo.b.compare(Foo.c) == .less)

    XCTAssert(Foo.b.compare(Foo.a) == .greater)
    XCTAssert(Foo.c.compare(Foo.a) == .greater)
    XCTAssert(Foo.c.compare(Foo.b) == .greater)
  }

  func testBoolCompare() {
    XCTAssert(false.compare(true) == .less)
    XCTAssert(false.compare(false) == .equal)
    XCTAssert(true.compare(false) == .greater)
  }
  
}
