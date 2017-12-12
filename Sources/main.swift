import Vapor

let drop = try Droplet()

drop.get("/") { req in
  var json = JSON()
  try json.set("version", 1.0)
  try json.set("timestamp", Date().rfc1123)
  return json
}

drop.get("/firebase") { req in
  let rq = Request(method: .put, uri: "<firebase uri>")
  rq.query?["auth"] = "<your token here>"
  var json = JSON()
  try json.set("test", "name")
  rq.json = json

  let response = try drop.client.respond(to: rq)
  print("request: \(rq)")
  return "response: \(response)"
}

try drop.run()