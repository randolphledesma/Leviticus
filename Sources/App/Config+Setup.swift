extension Config {
    public func setup() throws {
      addConfigurable(middleware: ErrorHandlingMiddleware(), name: "error-handling")
    }
}
