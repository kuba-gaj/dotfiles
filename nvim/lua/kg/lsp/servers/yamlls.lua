return function(capabilities)
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	return {
		settings = {
			yaml = {
				schemas = require("schemastore").json.schemas(),
			},
		},
	}
end
