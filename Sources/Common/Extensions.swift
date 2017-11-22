// Copyright (c) 2017 Timofey Solomko
// Licensed under MIT License
//
// See LICENSE for license information

import Foundation

extension Data {

    func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.pointee }
    }

    func toArray<T>(type: T.Type) -> [T] {
        return self.withUnsafeBytes {
            [T](UnsafeBufferPointer(start: $0, count: self.count / MemoryLayout<T>.size))
        }
    }

}

extension UInt8 {

    func toInt() -> Int {
        return Int(bitPattern: UInt(self))
    }

}

extension UInt16 {

    func toInt() -> Int {
        return Int(bitPattern: UInt(self))
    }

}

extension UInt32 {

    func toInt() -> Int {
        return Int(bitPattern: UInt(self))
    }

}

extension UInt64 {

    func toInt() -> Int {
        return Int(bitPattern: UInt(self))
    }

}

extension Int {

    func toUInt8() -> UInt8 {
        return UInt8(truncatingIfNeeded: UInt(self))
    }

}

extension Date {

    init?(_ ntfsTime: UInt64?) {
        if let time = ntfsTime,
            let ntfsStartDate = DateComponents(calendar: Calendar(identifier: .iso8601),
                                               timeZone: TimeZone(abbreviation: "UTC"),
                                               year: 1601, month: 1, day: 1,
                                               hour: 0, minute: 0, second: 0).date {
            self.init(timeInterval: TimeInterval(time) / 10_000_000, since: ntfsStartDate)
        } else {
            return nil
        }
    }

}
