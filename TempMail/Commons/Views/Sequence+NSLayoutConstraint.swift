import UIKit

extension Sequence where Iterator.Element == NSLayoutConstraint {

    @discardableResult func activate() -> [NSLayoutConstraint] {
        guard let constraints = self as? [NSLayoutConstraint] else { fatalError() }
        constraints.forEach { $0.isActive = true }
        return constraints
    }

    @discardableResult func constant(_ value: CGFloat) -> [NSLayoutConstraint] {
        guard let constraints = self as? [NSLayoutConstraint] else { fatalError() }
        constraints.forEach { $0.constant = value }
        return constraints
    }

}
