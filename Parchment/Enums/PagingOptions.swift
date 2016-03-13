import UIKit

public enum PagingMenuItemSize {
  case Fixed(width: CGFloat, height: CGFloat)
  case SizeToFit(minWidth: CGFloat, height: CGFloat)
  
  var height: CGFloat {
    switch self {
    case let .Fixed(_, height): return height
    case let .SizeToFit(_, height): return height
    }
  }
}

public enum PagingIndicatorOptions {
  case Hidden
  case Visible(
    height: CGFloat,
    zIndex: Int,
    insets: UIEdgeInsets,
    backgroundColor: UIColor)
}

public enum PagingBorderOptions {
  case Hidden
  case Visible(
    height: CGFloat,
    zIndex: Int,
    insets: UIEdgeInsets,
    backgroundColor: UIColor)
}

public enum PagingSelectedScrollPosition {
  case Left
  case Right
  case AlwaysCentered
  case PreferCentered
  
  public func collectionViewScrollPosition() -> UICollectionViewScrollPosition {
    switch self {
    case .Left:
      return .Left
    case .Right:
      return .Right
    case .AlwaysCentered, .PreferCentered:
      return .CenteredHorizontally
    }
  }
}

public protocol PagingTheme {
  var font: UIFont { get }
  var textColor: UIColor { get }
  var selectedTextColor: UIColor { get }
  var backgroundColor: UIColor { get }
  var headerBackgroundColor: UIColor { get }
}

public protocol PagingOptions {
  var theme: PagingTheme { get }
  var menuItemSize: PagingMenuItemSize { get }
  var borderOptions: PagingBorderOptions { get }
  var indicatorOptions: PagingIndicatorOptions { get }
  var selectedScrollPosition: PagingSelectedScrollPosition { get }
}
