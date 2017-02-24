package main

import (
	"fmt"
	"net/http"
	//"io/ioutil"
)

type AppHandler struct {
	appName string
}

func (index *AppHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello, %s!", index.appName)
	//fmt.Printf("%x", r)
	r.ParseForm()
	//fmt.Printf("=== %x", r.Form)
	fmt.Printf("=== %s \n", r.Form["1"])
	//result, _:= ioutil.ReadAll(r.Body)
	//r.Body.Close()
	//fmt.Printf("%s\n", result)
}

func main() {
	index := new(AppHandler)
	index.appName = "sample app"
	http.Handle("/hello", index)
	http.ListenAndServe(":8061", nil)
}
