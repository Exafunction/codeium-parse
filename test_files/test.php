<?php
namespace test;

function foo()
{
}

// FooInterface.
interface FooInterface
{
    public function encode(...$numbers);
}

// FooClass.
class FooClass implements FooInterface
{
    // Constructor comment.
    function __construct() {}
    /**
     * @param mixed $numbers
     * @return string
     */
    public function encode(...$numbers)
    {
    }
}
