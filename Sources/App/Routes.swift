import Foundation
import Vapor

extension Droplet {
    func setupRoutes() throws {

      get("/") { req in
        var json = JSON()
        try json.set("version", 1.0)
        try json.set("timestamp", Date().rfc1123)
        return json
      }

      get("delay") { req in
        do {
          let res = try Portal<String>.open(timeout: 10) { portal in
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let datatask = session.dataTask(with: URL(string: "https://httpbin.org/delay/11")!) { data, urlResponse, error in
              portal.close(with: Bytes(data!).makeString())
            }
            datatask.resume()
          }
          return res
        } catch {
          return "error"
        }
      }

      get("_f") { req in
        let rq = Request(method: .put, uri: "<firebase uri>")
        rq.query?["auth"] = "<token>"
        var json = JSON()
        try json.set("ten", "commandments")
        rq.json = json

        let response = try self.client.respond(to: rq)
        print("request: \(rq)")
        return "response: \(response)"
      }
    }
}
