import { named1, named2 as alias2, named3 as alias3 } from "path/to/file/1";
import default1 from "path/to/file/2";
import { named4 as alias4, named5 as alias5, type NamedType1 as AliasType1 } from "path/to/file/3";
import default2, { named4 as alias4 } from 'npm-lib-1'
import * as entireModule from "npm-lib-2";
import type { NamedType2 } from "path/to/file/4";
import default3 = require('npm-lib-3');
import "./side-effects-only-1.ts";

/** f comment. */
function f(a: string): string;
function f(a: any): any {
    import default4 from 'npm-lib-4';
    return a;
}
/** f2 comment. */
declare function f2(a: number): void;
/** f3 comment. */
export function f3(): void;
export function f3(): void {}

/** f4 comment. */
export declare function f4(): void;

/** Foo comment. */
class Foo {
    // Constructor comment.
    constructor() {}
    /** methodSignature comment. */
    methodSignature(): void;
    /** methodSignature comment. */
    methodSignature(): void {}
}

/** Foo2 comment. */
declare class Foo2 {
    /** methodSignature2 comment. */
    methodSignature2(): void;
}
// *Foo3 comment.""
export declare class Foo3 {};

/** Module comment. */
module Module {}
/** Module2 comment. */
export module Module2 {}
/** Module3 comment. */
declare module 'module';

/** AbstractClass comment. */
abstract class AbstractClass {
    /** Abstract method comment. */
    abstract method(a: string): void;
}

/** AbstractClass2 comment. */
export abstract class AbstractClass2 {}

/** AbstractClass3 comment. */
declare abstract class AbstractClass3 {}

/** AbstractClass4 comment. */
export declare abstract class AbstractClass4 {}

/** Interface comment. */
interface Interface {
    /** Interface method comment. */
    interfaceMethod(a: string): void;
}

/** Interface2 comment. */
export interface Interface2 {}

/** Interface3 comment. */
declare interface Interface3 {}

/** Interface4 comment. */
export declare interface Interface4 {};

/** FooString comment. */
type FooString = string;
/** FooString2 comment. */
export type FooString2 = string;
/** FooString3 comment. */
declare type FooString3 = string;
/** FooString4 comment. */
export declare type FooString4 = string;

/** NamespaceFoo comment. */
namespace NamespaceFoo {}
/** NamespaceFoo2 comment. */
export namespace NamespaceFoo2 {}
/** NamespaceFoo3 comment. */
declare namespace NamespaceFoo3 {}
/** NamespaceFoo4 comment. */
export declare namespace NamespaceFoo4 {};
