// swiftlint:disable identifier_name
import Foundation

func crypto(_ f: (UnsafeMutablePointer<UInt8>, UnsafePointer<UInt8>) -> Int32,
            _ a: @autoclosure () -> Data,
            _ b: Data) -> Data? {
    var a = a()
    guard a.withUnsafeMutableBytes({ a in
        b.withUnsafeBytes { b in
            f(a.bindMemory(to: UInt8.self).baseAddress!,
              b.bindMemory(to: UInt8.self).baseAddress!)
        }
    }) == 0 else {
        return nil
    }
    return a
}

func crypto(_ f: (UnsafeMutablePointer<UInt8>, UnsafePointer<UInt8>, UnsafePointer<UInt8>) -> Int32,
            _ a: @autoclosure () -> Data,
            _ b: Data,
            _ c: Data) -> Data? {
    var a = a()
    guard a.withUnsafeMutableBytes({ a in
        b.withUnsafeBytes { b in
            c.withUnsafeBytes { c in
                f(a.bindMemory(to: UInt8.self).baseAddress!,
                  b.bindMemory(to: UInt8.self).baseAddress!,
                  c.bindMemory(to: UInt8.self).baseAddress!)
            }
        }
    }) == 0 else {
        return nil
    }
    return a
}
