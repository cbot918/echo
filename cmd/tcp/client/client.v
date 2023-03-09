module main

import net

fn main(){
	mut conn := net.dial_tcp("localhost:8888") or {
		println("net.dial_tcp failed")
		return
	}
	
	conn.write_string("hihi") or {
		println("conn.write_string failed")
		return
	}

	// mut res := conn.read_line()
	// println("server: ${res}")
}