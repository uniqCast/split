#!/usr/bin/env lua
local t = require 'tapered'
package.path = '../src/?.lua;' .. package.path
local split = require 'split'.split
local join = table.concat

local s, got

s = ''
got = split(s, ',')
t.same(got, {}, 'Empty string param should return empty table')
print("Here's what I got '" .. type(got) .. "'.")
for k, v in pairs(got) do
  print("k -> " .. k .. "\tv -> " .. v)
end

s = 'foobar'
got = split(s, ',')
t.is(#got, 1, 'Split \'foobar\' on commas should have one item.')
t.is(got[1], 'foobar', 'First item should be \'foo\'.')

s = 'foo,bar'
got = split(s, ',')
t.is(#got, 2, 'Split \'foo,bar\' on commas should have two items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')

s = '1 2'
got = split(s, ' ')
t.is(#got, 2, 'Split \'1 2\' on a literal space should have two items.')
t.is(got[1], '1', 'First item should be \'1\'.')
t.is(got[2], '2', 'Second item should be \'2\'.')

s = 'foo bar'
got = split(s, '%s')
t.is(#got, 2, 'Split \'foo bar\' on space pattern [%s] should have two items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')

s = 'foo bar'
got = split(s, '%s+')
t.is(#got, 2, 'Split \'foo bar\' on space pattern [%s+] should have two items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')

s = 'foo\tbar'
got = split(s, '%s+')
t.is(#got, 2, 'Split \'foo\tbar\' on space pattern [%s+] should have two items.')
t.is(got[1], 'foo', 'First item should be \'foo\'.')
t.is(got[2], 'bar', 'Second item should be \'bar\'.')

t.done()
