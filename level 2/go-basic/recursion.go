package main

import "fmt"

func fact(n int) int {
	if n == 0 {
		return 1
	}
	return n * fact(n-1)
}

func main() {
	fmt.Println(fact(7))

	var fib func(n int) int

	fib = func(n int) int {
		if n < 2 {
			return n
		}

		//         6              5
		//	  5       4       4       3
		// 	4   3   3   2   3   2   2 fn1
		// 3   2   2 fn1 2 fn1 fn1 2 fn1 fn1 fn1
		//2 fn1 fn1  fn1    fn1    fn1
		//fn1
		return fib(n-1) + fib(n-2)
	}

	fmt.Println(fib(7))
}
