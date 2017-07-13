extension UIApplicationState: CustomStringConvertible {
    public var description: String {
        switch self {
        case .background: return "background"
        case .inactive: return "inactive"
        case .active: return "active"
        }
    }
}