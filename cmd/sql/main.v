module main

import elliotchance.vsql.vsql
import net

fn example() ! {
  mut db := vsql.open('mydb.vsql') !

  // All SQL commands use query():
      db.query('CREATE TABLE foo (x DOUBLE PRECISION)') !
      db.query('INSERT INTO foo (x) VALUES (1.23)') !
  db.query('INSERT INTO foo (x) VALUES (4.56)') !

  // Iterate through a result:
  result := db.query('SELECT * FROM foo') !
  println(result.columns)

  for row in result {
      println(row.get_f64('X') !)
  }

  // See SQLSTATE (Errors) below for more examples.
}

fn main(){
	net.http
	example() or {
		println("example failed")
		return 
	}
}