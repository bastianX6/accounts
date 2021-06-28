//
//  UIColor+Additions.swift
//
//  Generated on Zeplin. (16/9/2020).

#if canImport(UIKit)
    import UIKit
#endif

#if os(watchOS) || os(tvOS)

    extension UIColor {
        // MARK: - Colors

        @nonobjc class var tintsSystemTealDark: UIColor {
            return UIColor(red: 100.0 / 255.0, green: 210.0 / 255.0, blue: 1.0, alpha: 1.0)
        }

        @nonobjc class var tintsSystemIndigoDark: UIColor {
            return UIColor(red: 94.0 / 255.0, green: 92.0 / 255.0, blue: 230.0 / 255.0, alpha: 1.0)
        }

        // MARK: - Grey light's colors

        @nonobjc class var greySystemGrey2Light: UIColor {
            return UIColor(red: 174.0 / 255.0, green: 174.0 / 255.0, blue: 178.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey3Light: UIColor {
            return UIColor(red: 199.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey4Light: UIColor {
            return UIColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey5Light: UIColor {
            return UIColor(red: 229.0 / 255.0, green: 229.0 / 255.0, blue: 234.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey6Light: UIColor {
            return UIColor(red: 242.0 / 255.0, green: 242.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
        }

        // MARK: - Grey Dark's colors

        @nonobjc class var greySystemGrey2Dark: UIColor {
            return UIColor(red: 99.0 / 255.0, green: 99.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey3Dark: UIColor {
            return UIColor(red: 72.0 / 255.0, green: 72.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey4Dark: UIColor {
            return UIColor(red: 58.0 / 255.0, green: 58.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey5Dark: UIColor {
            return UIColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey6Dark: UIColor {
            return UIColor(red: 28.0 / 255.0, green: 28.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
        }
    }

#endif

#if os(tvOS) || os(iOS)
    extension UIColor {
        @nonobjc class func dynamicColor(light: UIColor, dark: UIColor) -> UIColor {
            return UIColor { (traits) -> UIColor in
                traits.userInterfaceStyle == .dark ?
                    dark :
                    light
            }
        }
    }
#endif
