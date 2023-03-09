module main

import net.http
import vweb

struct MyHandler {}

pub fn (mh MyHandler) handle(req http.Request) http.Response{
	println("hellloooooo")
	return http.Response{}
}

fn main(){
	mut server := http.Server{
		handler: MyHandler{}
	}


	server.listen_and_serve()
}