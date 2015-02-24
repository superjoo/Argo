import Foundation
import Runes

extension String: JSONDecodable {
  public static func decode(j: JSONValue) -> String? {
    switch j {
    case let .JSONString(s): return s
    default: return .None
    }
  }
}

extension Int: JSONDecodable {
  public static func decode(j: JSONValue) -> Int? {
    switch j {
    case let .JSONNumber(n): return n as Int
    default: return .None
    }
  }
}

extension Double: JSONDecodable {
  public static func decode(j: JSONValue) -> Double? {
    switch j {
    case let .JSONNumber(n): return n as Double
    default: return .None
    }
  }
}

extension Bool: JSONDecodable {
  public static func decode(j: JSONValue) -> Bool? {
    switch j {
    case let .JSONNumber(n): return n as Bool
    default: return .None
    }
  }
}

extension Float: JSONDecodable {
  public static func decode(j: JSONValue) -> Float? {
    switch j {
    case let .JSONNumber(n): return n as Float
    default: return .None
    }
  }
}

public func decodeArray<A where A: JSONDecodable, A == A.DecodedType>(value: JSONValue) -> [A]? {
  switch value {
  case let .JSONArray(a): return sequence({ A.decode($0) } <^> a)
  default: return .None
  }
}