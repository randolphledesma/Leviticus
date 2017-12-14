import HTTP
import Vapor

struct ErrorHandlingMiddleware: Middleware {

  func respond(to request: Request, chainingTo next: Responder) throws -> Response {
    do {
      return try next.respond(to: request)
    } catch {

      #if DEBUG
        print("\(error)")
      #endif

      let status: Status = Status(error)

      var body = JSON()
      try body.set("error", true)

      if status == .notFound {
        try body.set("reason", "Route Not Found")
      } else {
        try body.set("reason", "Internal Server Error")
      }

      let response = Response(status: status, body: body)
      response.headers["Content-Type"] = "application/json; charset=utf-8"
      return response
    }
  }

}

extension Status {
  internal init(_ error: Error) {
    if let abort = error as? AbortError {
      self = abort.status
    } else {
      self = .internalServerError
    }
  }
}