all: build

build:
	clang -fobjc-arc -framework Cocoa -Wall -o awakened awakened.m
