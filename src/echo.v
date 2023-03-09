module echo

import net.http

struct MyHandler {}

pub fn (mh MyHandler) handle(req http.Request) http.Response{
	println("hellloooooo")
	return http.Response{}
}

struct Echo{
mut:
	server http.Server
}

pub fn new_echo() Echo{
	return Echo{}
}

pub fn (mut e Echo) run (port int){
	e.server = http.Server{
		handler:MyHandler{}
		port: port
	}
	println("listening on: ${port}")
	e.server.listen_and_serve()
}

