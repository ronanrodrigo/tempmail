import UIKit

typealias FontStyles = (normal: UIFont, bold: UIFont)

extension UIFont {
    static let small: FontStyles = (
        normal: UIFont.systemFont(ofSize: 10),
        bold: UIFont.systemFont(ofSize: 10, weight: UIFontWeightBold))
    static let normal: FontStyles = (
        normal: UIFont.systemFont(ofSize: 12),
        bold: UIFont.systemFont(ofSize: 12, weight: UIFontWeightBold))
    static let large: FontStyles = (
        normal: UIFont.systemFont(ofSize: 14),
        bold: UIFont.systemFont(ofSize: 14, weight: UIFontWeightBold))
}
