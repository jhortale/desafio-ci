// package main

// import "fmt"

// func sum(x int, y int) int {
// 	return x + y
// }

// func main() {
// 	fmt.Println(sum(5, 5))
// }

package main

import "testing"

func TestAdd(t *testing.T) {
	result := add(5, 5)
	expected := 10
	if result != expected {
		t.Errorf("add() test returned an unexpected result: got %v want %v", result, expected)
	}
}
