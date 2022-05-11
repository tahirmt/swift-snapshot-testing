//
//  ImageDefaults.swift
//  SnapshotTesting
//
//  Created by Mahmood Tahir on 2022-04-17.
//

import Foundation


/// Default properties for global image diffing default values
public enum SnapshottingImageDefaults {
    /// The percentage of pixels that must match. Value between 0-1
    public static var precision: Float = 1

    /// The byte-value threshold at which two subpixels are considered different. Value between 0-255
    public static var subpixelThreshold: UInt8 = 0
}
