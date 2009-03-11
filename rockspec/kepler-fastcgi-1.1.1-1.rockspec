package = "Kepler-Fastcgi"

version = "1.1.1-1"

description = {
  summary = "The Lua Web Development Platform",
  detailed = [[
Kepler is a Lua web development platform that offers the same advantages of Lua. Kepler is simple, portable, light, embeddable and extensible. This is the
FastCGI launcher. ]],
  license = "MIT/X11",
  homepage = "http://www.keplerproject.org/kepler"
}

dependencies = { "kepler >= 1.1.1", "wsapi-fcgi >= 1.1", "coxpcall >= 1.13" }

source = {
  url = ""
}

build = {
   platforms = {
     unix = {
       type = "none",
       install = {
         bin = { "src/cgilua.fcgi", "src/op.fcgi" },
       },
     },
     windows = {
       type = "make",
       build_pass = true,
       build_target = "fcgi",
       build_variables = {
         CFLAGS = "$(CFLAGS)",
	 LUA_INCDIR = "$(LUA_INCDIR)",
	 LUA_LIB = "$(LUA_LIBDIR)\\lua5.1.lib"
       },
       install_target = "install-fastcgi",
       install_variables = {
         PREFIX  = "$(PREFIX)",
         LUA_DIR = "$(LUADIR)",
         BIN_DIR = "$(BINDIR)"
       },
     }
   }
}
