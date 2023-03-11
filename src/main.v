module main

import echo
import net.http

// User Controller Class
pub fn hello(req http.Request) http.Response{
	println("in hello")
	return http.Response{}
}

fn main(){
	mut api := echo.new_echo()

	api.get('/', hello )

	api.run(8888)
}