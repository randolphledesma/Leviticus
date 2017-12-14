public struct Env {

    private static let production : Bool = {
      #if DEBUG
        return false
      #elseif ADHOC
        return false
      #else
        return true
      #endif
    }()

    public static func isProduction() -> Bool {
      return self.production
    }

}