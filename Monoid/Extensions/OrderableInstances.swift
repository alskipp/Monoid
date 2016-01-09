//  Copyright © 2016 Al Skipp. All rights reserved.

extension String: Orderable {}

extension Int: Orderable {}
extension Int64: Orderable {}
extension Int32: Orderable {}
extension Int16: Orderable {}
extension Int8: Orderable {}

extension UInt64: Orderable {}
extension UInt32: Orderable {}
extension UInt16: Orderable {}
extension UInt8: Orderable {}

extension Double: Orderable {}
extension Float: Orderable {}
extension Float80: Orderable {}


extension Bool: Comparable, Orderable {}

public func < (x: Bool, y: Bool) -> Bool {
  switch (x, y) {
  case (false, true): return true
  default: return false
  }
}
