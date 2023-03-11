module echo

import net.http

struct MyHandler {}
pub fn (mh MyHandler) handle(req http.Request) http.Response{
	println(req)
	println("in handle")
	return http.Response{}
}

// Echo Class
struct Echo{
mut:
	server http.Server
	request http.Request
}
pub fn new_echo() Echo{
	return Echo{}
}

type HandlerFunc = fn (http.Request) http.Response

pub fn (e Echo) get(path string, hf HandlerFunc){
	println("in get")

	// TODO: get req from MyHandler{}
	req := http.Request{}
	hf(req)
}


pub fn (mut e Echo) run (port int){
	e.server = http.Server{
		handler: MyHandler{}
		port: port
	}

	e.server.listen_and_serve() // call handle
}