// 實驗go的 closure寫法
// https://ithelp.ithome.com.tw/articles/10218856

module main

struct Store{
	add fn()
	minus fn()
	print fn()
}


fn main(){

	counter := fn ()Store{
		mut i := 0
		return Store{
			fn(){
				i++
			},
			fn(){
				i--
			},
			fn(){
				println("i=${i}")
			},
		}
	}

}