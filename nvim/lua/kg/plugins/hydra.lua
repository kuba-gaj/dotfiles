local present = pcall(require, "hydra")

if not present then
  return
end

require('kg.plugins.hydra-git')
require('kg.plugins.hydra-windows')
