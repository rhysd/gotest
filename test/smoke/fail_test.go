package main

import (
	"testing"
)

func TestFailSkip(t *testing.T) {
	t.Skip("for testing gotest")
}

func TestFailPass(t *testing.T) {
	// Do nothing
}

func TestFailFail(t *testing.T) {
	t.Fatal()
}
