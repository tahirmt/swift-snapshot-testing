#if os(iOS) || os(tvOS)
import UIKit

extension Snapshotting where Value == UIWindow, Format == UIImage {
    /// A snapshot strategy for comparing window based on pixel equality.
    public static var image: Snapshotting {
        return .image()
    }

    /// A snapshot strategy for comparing view window based on pixel equality.
    ///
    /// - Parameters:
    ///   - config: A set of device configuration settings.
    ///   - precision: The percentage of pixels that must match.
    ///   - subpixelThreshold: The byte-value threshold at which two subpixels are considered different.
    ///   - size: A view size override.
    ///   - traits: A trait collection override.
    public static func image(
        on config: ViewImageConfig,
        precision: Float = SnapshottingImageDefaults.precision,
        subpixelThreshold: UInt8 = SnapshottingImageDefaults.subpixelThreshold,
        size: CGSize? = nil,
        traits: UITraitCollection = .init()
    )
    -> Snapshotting {
        SimplySnapshotting.image(precision: precision, subpixelThreshold: subpixelThreshold, scale: traits.displayScale).asyncPullback { window in
            snapshotWindow(
                config: size.map { .init(safeArea: config.safeArea, size: $0, traits: config.traits) } ?? config,
                traits: traits,
                window: window
            )
        }
    }

    /// A snapshot strategy for comparing window based on pixel equality.
    ///
    /// - Parameters:
    ///   - precision: The percentage of pixels that must match.
    ///   - subpixelThreshold: The byte-value threshold at which two subpixels are considered different.
    ///   - size: A view size override.
    ///   - traits: A trait collection override.
    public static func image(
        precision: Float = SnapshottingImageDefaults.precision,
        subpixelThreshold: UInt8 = SnapshottingImageDefaults.subpixelThreshold,
        size: CGSize? = nil,
        traits: UITraitCollection = .init()
    )
    -> Snapshotting {
        SimplySnapshotting.image(precision: precision, subpixelThreshold: subpixelThreshold, scale: traits.displayScale).asyncPullback { window in
            snapshotWindow(
                config: .init(safeArea: .zero, size: size ?? window.frame.size, traits: .init()),
                traits: traits,
                window: window
            )
        }
    }
}
#endif
