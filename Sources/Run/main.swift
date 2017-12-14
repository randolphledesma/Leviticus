import App

if Env.isProduction() {
  print("Running Production Build")
} else {
  print("Running Development Build")
}

let config = try Config()
try config.setup()

let drop = try Droplet(config)
try drop.setup()
try drop.run()
