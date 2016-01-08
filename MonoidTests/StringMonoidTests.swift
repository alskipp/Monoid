//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class StringMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(String.mempty == "")
  }

  func testMappend() {
    XCTAssertTrue("" <> "" <> "" == "")
    XCTAssertTrue("" <> "" <> "a" == "a")
    XCTAssertTrue("" <> "" <> "b" == "b")

    XCTAssertTrue("" <> "a" <> "" == "a")
    XCTAssertTrue("" <> "a" <> "b" == "ab")
    XCTAssertTrue("a" <> "b" <> "c" == "abc")

    XCTAssertTrue("a" <> "b" <> "" == "ab")
    XCTAssertTrue("" <> "a" <> "bc" == "abc")
    XCTAssertTrue("a" <> "" <> "bc" == "abc")
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat(["", "", ""]) == "")
    XCTAssertTrue(.mconcat(["", "", "a"]) == "a")
    XCTAssertTrue(.mconcat(["", "", "b"]) == "b")

    XCTAssertTrue(.mconcat(["", "a", ""]) == "a")
    XCTAssertTrue(.mconcat(["", "a", "b"]) == "ab")
    XCTAssertTrue(.mconcat(["a", "b", "c"]) == "abc")

    XCTAssertTrue(.mconcat(["a", "b", ""]) == "ab")
    XCTAssertTrue(.mconcat(["", "a", "bc"]) == "abc")
    XCTAssertTrue(.mconcat(["a", "", "bc"]) == "abc")
  }

  func test_single_CharString_mconcatPerformance() {
    let stringArray = Array(count: 250_000, repeatedValue: "x")

    self.measureBlock {
      String.mconcat(stringArray)
    }
  }

  func test_large_string_mconcatPerformance() {
    let s = Array(count: 100_000, repeatedValue: "x").joinWithSeparator("")
    let strArr = Array(count: 50, repeatedValue: s)

    self.measureBlock {
      String.mconcat(strArr)
    }
  }
}
