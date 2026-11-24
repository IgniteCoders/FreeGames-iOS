//
//  UIView+Styles.swift
//  FreeGames
//
//  Created by IgniteCoders on 29/04/24.
//

import Foundation
import UIKit

public extension UIView {
    /// Rounds all corners of the view by setting `layer.cornerRadius`.
    ///
    /// - Important:
    ///   - This sets `layer.masksToBounds = true`, which clips subviews to the view’s bounds and will hide any shadow drawn by this view’s layer.
    ///   - If you need both rounded corners and a visible shadow, use two views:
    ///     - An inner view for your content with `masksToBounds = true` and rounded corners.
    ///     - An outer container view for the shadow with `masksToBounds = false`.
    ///
    /// - Parameter radius: The corner radius, in points.
    /// - Returns: The view itself, enabling chaining.
    @discardableResult
    func roundCorners(radius: CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        return self
    }

    /// Makes the view appear circular based on its current bounds.
    ///
    /// - Note:
    ///   Uses `min(bounds.width, bounds.height) / 2`. Ensure the view has been laid out
    ///   (e.g., call from `layoutSubviews`, `viewDidLayoutSubviews`, or after Auto Layout has run)
    ///   so that `bounds` reflects the final size.
    ///
    /// - Returns: The view itself, enabling chaining.
    @discardableResult
    func roundAsCircle() -> Self {
        let diameter = min(bounds.width, bounds.height)
        return roundCorners(radius: diameter / 2)
    }

    /// Adds a border to the view by configuring the layer’s `borderWidth` and `borderColor`.
    ///
    /// - Parameters:
    ///   - width: The border width, in points. Defaults to `1`.
    ///   - color: The border color.
    /// - Returns: The view itself, enabling chaining.
    @discardableResult
    func setBorder(width: CGFloat = 1, color: UIColor) -> Self {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        return self
    }

    /// Applies a drop shadow to the view’s layer.
    ///
    /// - Important:
    ///   - This sets `layer.masksToBounds = false` so the shadow can extend beyond the view’s bounds.
    ///   - If you also need rounded corners on the same view, the shadow may appear clipped if `masksToBounds` is set to `true` elsewhere.
    ///     Prefer using a container view for the shadow and an inner view for rounded content:
    ///     ```
    ///     // Example:
    ///     shadowContainer.addSubview(contentView)
    ///     contentView.roundCorners(radius: 12)
    ///     shadowContainer.roundCorners(radius: 12)
    ///     shadowContainer.setShadow()
    ///     ```
    ///
    /// - Parameters:
    ///   - color: The shadow color. Defaults to `.black`.
    ///   - opacity: The shadow opacity from `0.0` to `1.0`. Defaults to `0.5`.
    ///   - radius: The blur radius (softness) of the shadow, in points. Defaults to `3`.
    ///   - offset: The horizontal and vertical offset of the shadow. Defaults to `(4, 4)`.
    ///
    /// - Returns: The view itself, enabling chaining.
    @discardableResult
    func setShadow(
        color: UIColor = .lightGray,
        opacity: Float = 0.5,
        radius: CGFloat = 3,
        offset: CGSize = CGSize(width: 4, height: 4)
    ) -> Self {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        return self
    }
}
