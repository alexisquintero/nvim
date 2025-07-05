return {
  'mfussenegger/nvim-dap',
  lazy = false,
  config = function()
    local dap = require("dap")

    dap.configurations.scala = {
      {
        type = "scala",
        request = "launch",
        name = "Run or Test Target",
        metals = {
          runType = "runOrTestFile",
        },
      },
      {
        type = "scala",
        request = "launch",
        name = "Test Target",
        metals = {
          runType = "testTarget",
        },
      },
      {
        type = "scala",
        request = "attach",
        name = "Attach to Localhost",
        hostName = "localhost",
        port = 5005,
        buildTarget = "root",
      }
    }
  end
}
