module echo

type HandlerFunc = fn (http.Request) http.Response 

struct Echo{}

pub fn new(){
	
}

pub fn (e Echo) get(path string,  hf HandlerFunc) Route {
	return e.add('get', path, hf)
}

pub fn (e Echo) post(path string, hf HandlerFunc) Route {
	return e.add('post', path, hf)
}


pub fn (e Echo) add(method string, path string, handler HandlerFunc) Route {
	name := find_name()
	return router.add(method, path, name, ) 
}


struct Route{
	method	string
	path		string
	name		string
}
pub fn new_route() Route{
	return Route{}
}

pub fn (r Route) add(){
	
}

// fn (e Echo) _add(host string, method string, handler HandlerFunc) Route{

// }

	// Router struct {
	// 	tree   *node
	// 	routes map[string]*Route
	// 	echo   *Echo
	// }

	// Route struct {
	// 	Method string `json:"method"`
	// 	Path   string `json:"path"`
	// 	Name   string `json:"name"`
	// }

// 確定裡面真的有這個 router, 先省略
// func (e *Echo) findRouter(host string) *Router {
// 	if len(e.routers) > 0 {
// 		if r, ok := e.routers[host]; ok {
// 			return r
// 		}
// 	}
// 	return e.router
// }

// name: 取出字串或者是func指標
// func handlerName(h HandlerFunc) string {
// 	t := reflect.ValueOf(h).Type()
// 	if t.Kind() == reflect.Func {
// 		return runtime.FuncForPC(reflect.ValueOf(h).Pointer()).Name()
// 	}
// 	return t.String()
// }

// router.add
// func (r *Router) add(method, path, name string, h HandlerFunc) *Route {
// 	r.Add(method, path, h)

// 	route := &Route{
// 		Method: method,
// 		Path:   path,
// 		Name:   name,
// 	}
// 	r.routes[method+path] = route
// 	return route
// }

func (e *Echo) add(host, method, path string, handler HandlerFunc, middlewares ...MiddlewareFunc) *Route {
	router := e.findRouter(host)
	//FIXME: when handler+middleware are both nil ... make it behave like handler removal
	name := handlerName(handler)
	route := router.add(method, path, name, func(c Context) error {
		h := applyMiddleware(handler, middlewares...)
		return h(c)
	})

	if e.OnAddRouteHandler != nil {
		e.OnAddRouteHandler(host, *route, handler, middlewares)
	}

// 	return route
// }

// func (e *Echo) Add(method, path string, handler HandlerFunc, middleware ...MiddlewareFunc) *Route {
// 	return e.add("", method, path, handler, middleware...)
// }



// // GET registers a new GET route for a path with matching handler in the router
// // with optional route-level middleware.
// func (e *Echo) GET(path string, h HandlerFunc, m ...MiddlewareFunc) *Route {
// 	return e.Add(http.MethodGet, path, h, m...)
// }