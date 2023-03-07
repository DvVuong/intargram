// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///   IntargramHandmade
  /// 
  ///   Created by BeeTech on 06/03/2023.
  internal static let emailCannotBeEmpty = L10n.tr("Localizable", "Email cannot be empty", fallback: "Email cannot be empty")
  /// Email invalidate
  internal static let emailInvalidate = L10n.tr("Localizable", "Email invalidate", fallback: "Email invalidate")
  /// Exactly
  internal static let exactly = L10n.tr("Localizable", "Exactly", fallback: "Exactly")
  /// Full name cannot empty
  internal static let fullNameCannotEmpty = L10n.tr("Localizable", "Full name cannot empty", fallback: "Full name cannot empty")
  /// Login failed
  internal static let loginFailed = L10n.tr("Localizable", "Login failed", fallback: "Login failed")
  /// ok
  internal static let ok = L10n.tr("Localizable", "ok", fallback: "ok")
  /// Password cannot be empty
  internal static let passwordCannotBeEmpty = L10n.tr("Localizable", "Password cannot be empty", fallback: "Password cannot be empty")
  /// Password must be more than 8 characters
  internal static let passwordMustBeMoreThan8Characters = L10n.tr("Localizable", "Password must be more than 8 characters", fallback: "Password must be more than 8 characters")
  /// Successful account registration
  internal static let successfulAccountRegistration = L10n.tr("Localizable", "Successful account registration", fallback: "Successful account registration")
  /// User name cannot empty
  internal static let userNameCannotEmpty = L10n.tr("Localizable", "User name cannot empty", fallback: "User name cannot empty")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
