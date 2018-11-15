package main

import (
	"testing"
)

func TestPassSkip(t *testing.T) {
	t.Skip("for testing gotest")
}

func TestPassPass(t *testing.T) {
	// Do nothing
}
