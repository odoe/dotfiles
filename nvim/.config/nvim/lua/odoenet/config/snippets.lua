local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.config.set_config {
    history = true,
    -- treesitter-hl has 100, use something higher (default is 200).
    ext_base_prio = 200,
    -- minimal increase in priority.
    ext_prio_increase = 1,
    enable_autosnippets = false,
    store_selection_keys = "<c-s>",
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("i", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("s", "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap("i", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

ls.add_snippets(nil, {
    typescript = {
        snip({
            trig = "stw",
            name = "StencilWidgetStuff",
            description = "Stencil Widget stuff"
        },
        {
            text({"static async importWidget"}),
            insert(1, "Name"),
            text({"(): Promise<typeof __esri."}),
            rep(1),
            text({"> {",
            "  if (amd) {"}),
            text({"\t", '        return requireModule("esri/widgets/'}),
            rep(1),
            text('");'),
            text { "", "  }" },
            text({"\t", '  const module = await import("@arcgis/core/widgets/'}),
            rep(1),
            text('");'),
            text({ "\t", "  return module.default;"}),
            text {"", "}" },
            text({"\t", ""}),
            text({"\t", ""}),
            text({"static async newWidget"}),
            rep(1),
            text({"(definition: __esri."}),
            rep(1),
            text({"Properties): Promise<__esri."}),
            rep(1),
            text({"> {",
            "  const Widget = await this.importWidget"}),
            rep(1),
            text({"();"}),
            text({"", "  return new Widget(definition);"}),
            text({"", "}"}),
            insert(0),
        }

        ),
    }
})
