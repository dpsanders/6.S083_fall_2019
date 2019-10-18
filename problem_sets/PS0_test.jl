# Simple file to test Julia and Atom install

using Test

function say_hello(name)
    println("Hello, ", name, "!")
    @test name == name
end

name = "David P. Sanders"
say_hello(name)
