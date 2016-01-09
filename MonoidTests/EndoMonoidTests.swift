//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class EndoMonoidTests: XCTestCase {

  let plusTwo = { (x: Int) in x + 2 }
  let multFive = { (x: Int) in x * 5 }

  func testMempty() {
    XCTAssertTrue(Endo.mempty.value(1) == 1)
  }

  func testMappend() {
    XCTAssertTrue((.mempty <> .mempty <> Endo(plusTwo)).value(1) == 3)
    XCTAssertTrue((Endo(multFive) <> .mempty <> Endo(plusTwo)).value(1) == 7)
    XCTAssertTrue((Endo.mempty <> .mempty <> .mempty).value(5) == 5)
    XCTAssertTrue((Endo(plusTwo) <> Endo(multFive) <> Endo(plusTwo)).value(1) == 17)
  }

  func testMconcat() {
    XCTAssertTrue(Endo<Int>.mconcat([.mempty, .mempty, Endo(plusTwo)]).value(1) == 3)
    XCTAssertTrue(Endo<Int>.mconcat([Endo(multFive), .mempty, Endo(plusTwo)]).value(1) == 7)
    XCTAssertTrue(Endo<Int>.mconcat([.mempty, .mempty, .mempty]).value(5) == 5)
    XCTAssertTrue(Endo<Int>.mconcat([Endo(plusTwo), Endo(multFive), Endo(plusTwo)]).value(1) == 17)
  }

  func testDescription() {
    XCTAssertTrue(Endo(plusTwo).description == "Endo(Function)")
  }

}
