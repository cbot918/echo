module main

import net

pub struct Server{
mut:
	listener	net.TcpListener
pub mut:
	port			int
}
pub fn new_server(port int) Server { 
	return Server{
		port: port
	} 
}

pub fn (mut s Server)  listen_and_serve(){
	
	s.listener = net.listen_tcp(.ip6, ':${s.port}') or {
		println("net.listen_tcp failed")
		return
	}

	println("listening on: ${s.port}")

	for {
		println("loop")
		mut conn := s.listener.accept() or {
			if err.code() == net.err_timed_out_code {
				// just skip network timeouts, they are normal
				println("net.err_timed_out")
				continue
			}
			eprintln('accept() failed, reason: ${err}; skipping')
			continue
		}

		s.parse_and_respond(mut conn)
	}

}
// fn (c TcpConn) read(mut buf []u8) !int
pub fn (mut s Server)  parse_and_respond(mut conn net.TcpConn){

	// mut buf := []u8{}
	data := conn.read_line()
	// println(buf.str())
	println("received: ${data}")

	conn.write_string("hellooo") or {
		println("conn.write_string failed")
		return
	}
	
}


fn main(){

	mut s := new_server(8888)
	
	s.listen_and_serve()

}