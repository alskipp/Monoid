//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Endo<A> {
  public let value: A -> A
  public init(_ v: A -> A) { value = v }
}

extension Endo: Monoid {
  public static var mempty: Endo {
    return Endo(id)
  }

  public static func combine(f: Endo, _ g: Endo) -> Endo {
    return Endo( { g.value(f.value($0)) } )
  }
}

extension Endo: CustomStringConvertible {
  public var description: String {
    return "Endo(Function)"
  }
}
