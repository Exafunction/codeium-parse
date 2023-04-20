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
    /**
     * @param mixed $numbers
     * @return string
     */
    public function encode(...$numbers)
    {
    }
}
