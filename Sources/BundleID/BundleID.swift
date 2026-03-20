//
//  BundleID.swift
//

import Foundation
import Tagged

public typealias BundleID = Tagged<Bundle, String>

public extension Bundle {
    var bundleID: BundleID {
        assert(bundleIdentifier != nil, "Bundle has no identifier")
        // swiftlint:disable:next force_unwrapping
        return BundleID(bundleIdentifier!)
    }
}
