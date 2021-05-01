//
//  NSColor+Additions.swift
//
//
//  Created by Bastián Véliz Vega on 16-09-20.
//

#if os(macOS)
    import AppKit

    extension NSColor {
        // MARK: - Grey light's colors

        @nonobjc class var greySystemGrey2Light: NSColor {
            return NSColor(red: 174.0 / 255.0, green: 174.0 / 255.0, blue: 178.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey3Light: NSColor {
            return NSColor(red: 199.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey4Light: NSColor {
            return NSColor(red: 209.0 / 255.0, green: 209.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey5Light: NSColor {
            return NSColor(red: 229.0 / 255.0, green: 229.0 / 255.0, blue: 234.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey6Light: NSColor {
            return NSColor(red: 242.0 / 255.0, green: 242.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
        }

        // MARK: - Grey Dark's colors

        @nonobjc class var greySystemGrey2Dark: NSColor {
            return NSColor(red: 99.0 / 255.0, green: 99.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey3Dark: NSColor {
            return NSColor(red: 72.0 / 255.0, green: 72.0 / 255.0, blue: 74.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey4Dark: NSColor {
            return NSColor(red: 58.0 / 255.0, green: 58.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey5Dark: NSColor {
            return NSColor(red: 44.0 / 255.0, green: 44.0 / 255.0, blue: 46.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class var greySystemGrey6Dark: NSColor {
            return NSColor(red: 28.0 / 255.0, green: 28.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
        }

        @nonobjc class func dynamicColor(light: NSColor, dark: NSColor) -> NSColor {
            return NSColor(name: nil) {
                switch $0.name {
                case .darkAqua, .vibrantDark, .accessibilityHighContrastDarkAqua, .accessibilityHighContrastVibrantDark:
                    return dark
                default:
                    return light
                }
            }
        }
    }

#endif
