-- Kotlin snippets

local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('kotlin', {
  s(
    'comp',
    fmt(
      [[
        @Composable
        fun []([]) {
          []
        }
      ]],
      {
        i(1, 'name'),
        i(2, 'params'),
        i(3, 'body'),
      },
      {
        delimiters = '[]',
      }
    )
  ),
})
