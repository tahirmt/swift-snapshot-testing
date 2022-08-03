//
//  ImageDefaults.swift
//  SnapshotTesting
//
//  Created by Mahmood Tahir on 2022-04-17.
//

import Foundation


public enum SnapshottingDefaults {
    /// The default subdirectory for snapshots in the same directory as the test file. Defaults to `__Snapshots__` that sits next to your test file. Only used when `snapshotDirectory` is nil.
    public static var snapshotSubdirectory = "__Snapshots__"
    /// Optional directory to save snapshots. By default snapshots will be saved in a directory with the same name as the test file, and that directory will sit inside a directory `__Snapshots__` that sits next to your test file.
    public static var snapshotDirectory: String? = nil
    /// The amount of time a snapshot must be generated in.
    public static var timeout: TimeInterval = 5
}

/// Default properties for global image diffing default values
public enum SnapshottingImageDefaults {
    /// The percentage of pixels that must match. Value between 0-1
    public static var precision: Float = 1

    /// The byte-value threshold at which two subpixels are considered different. Value between 0-255
    public static var subpixelThreshold: UInt8 = 0
}
