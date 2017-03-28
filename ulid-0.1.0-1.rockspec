package = "ulid"
version = "0.1.0-1"

source = {
  url = "https://github.com/Tieske/ulid.lua/archive/0.1.0.tar.gz",
  dir = "ulid.lua-0.1.0",
}

description = {
  summary = "Universally Unique Lexicographically Sortable Identifier for Lua",
  detailed = [[
    Universally Unique Lexicographically Sortable Identifier (ulid) is
    a format for unique identifiers that are partly time based and hence
    are ASCII sortable.
  ]],
  license = "MIT/X11",
  homepage = "http://tieske.github.io/ulid.lua/"
}

dependencies = {
}

build = {
  type = "builtin",
  modules = { 
     ["ulid"] = "src/ulid.lua",
  },
  copy_directories = {"docs"}  
}
