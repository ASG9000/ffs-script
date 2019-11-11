# FFS SCRIPT

FFS Script is a **F**ully **F**eatured and **S**imple programming lanuage that compiles to JavaScript.  It has been called the "language of the future" by leading authorities (in FFS Script (me)).

## Things that will make your life easier

You will need something like [Node.js](https://nodejs.org/) v8.6+ to run the JavaScript that results.

For processing the compiler output you may need [PERL 5.x](https://perl.org).
Also, you will need an IDE.  I use [Visual Studio Code](https://code.visualstudio.com/).

If you do choose VSCode then update the settings by editing `settings.json` so that it interprets `.ffs` files as JavaScript which will provide relatively sane syntax highlighting.  Your `settings.json` should look like:
```
// Place your settings in this file to overwrite the default settings
{
    ...
    "files.associations":{
        "*.ffs": "javascript"
    },
    ...
}
```

# Installation

Clone the repo then run `npm install -d`.

# Using the compiler

Call `ffs2js.sh path/yourscript.ffs` and if the compiler will write JavaScript to `path/yourscript.ffs.js`.

# Writing code

Look at the examples for clues as to how you will need to write your code.

Things you need to know about _FFS Script_:
1. Your executable scripts will need `main` defined.  `main` will be called and passed command line arguments as a list.  The compiler assumes that execution is in node.js and excludes node.js and the name of the script from the list.  If you don't care about command line arguments then your `main` will look like this: `const main = do([always(...), ...]);`
2. If you need to debug your scripts you can use `log` which sends the input to the console and passes the input through unmolested to the output.  You can also debug the generated JavaScript.
3. JavaScript standards are available as well, although many of them of are not well suited to _FFS Script_ programming and should be avoided in favour of what is provided in the standard library (e.g. use `log` instead of `console.log`).  We do at least fix `ParseInt` such that `const parseInts = map(ParseInt);` will behave as one might imagine it would.  If you need to use a method, then use it thusly: `const now = method('now'); const dateNow = now(Date); const main = do([always(dateNow), log]);` 

# Standard library

_FFS Script_ provides an exhaustive standard library (it's **F**ully **F**eatured after all) which allows you to program without the complexity and incompatibility of operator syntax.

1. _FFS Script_ supports all the functions provided by [Ramda](https://ramdajs.com/docs).  There are a few favourable tweaks: a) You do not need to prefix everything with `R.` since the functions are imported into the global namespace, (e.g. use `map` instead of `R.map`), b) `or` in _FFS Script_ is `R.or` is reversed (likewise for similar functions `and`, `gte`, `gt`, `lte`, `lt`, `subtract`, `divide`, `mathMod`, `modulo`), c) we provide a non-variadic alternative to `R.pipe` called `pipeArray`.  This is what `do` actually is.
2. _FFS Script_ supports [Folktale](https://folktale.origamitower.com/docs/v2.3.0/) data types.  The `maybe` and `result` types are capitalised in _FFS Script_ as is the `union` object which provides a way of defining your own 'Discriminated Union' types.  On top of this there are favourable tweaks as well: we provide a `matchWith` function which dispatches to the `matchWith` method of the object passed in, additionally in the pattern you pass to the `matchWith` function will be processed so that you are passed the value to your handler functions -- by default folktale passes handler functions an object which you have to unwrap to get the value.  There is also a `mapError` function which dispatches to the `mapError` method of the folktale object you are using.
3. Beyond that there is the ability to format strings with `format`.  In the string you can access property members by using curly braces.  So if your property is errorno, the string will contain `{errorno}`.  If you pass a list or any other type use `{0}` to refer to the first item.

# Hints

* To execute multiple statements use `do([...])`.
* To loop use `map`.
* To filter use `filter` or `reject`.
* To take multiple items and create one new item, use `reduce`.  Just remember to define the starting data, for returning a list your starting data will probably be an empty object, e.g. `reduce(mergeLeft, {})` which will take a list of objects and merge them into a single object.
* To print output use `log`.
* To format a string use `format`.  See the Star Wars API example.
* Mathematical and logical operators don't exist, use the function that corresponds to them, e.g. `or(X)`, `equals(0)` etc.
* To handle promises use `do([returnsPromise, then(do([a, b]))])` or `do([returnsPromise, then(a), then(b)])` where `returnsPromise` is an imaginary function which returns a promise.
* To handle rejected promises use `otherwise` instead of `then`.  See the Star Wars API example.
* To define conditions use `cond`.  `cond` takes a list of lists, the lists should have two entries, the first a condition and the second an expression to execute if the condition is true.  See the fizzbuzz example.  You should generally prefer the pattern matching of folktale over loosely defined `cond` statements, since the pattern matching forces you to handle every case -- see the use of the Result type in the Star Wars API example.
* To spread the input out across multiple executions use `juxt`, see the Star Wars API example.
* To perform multiple calculations and pass those values as arguments to a function use `converge`, see the Star Wars API example.
* To add a property to an object use `assoc` or `assocPath`, see the Star Wars API example.
* To access property values use `prop` or `path`, see the Star Wars API example.
* To create _FFS Script_ friendly functions that take more than one argument you will need to use `curry`.
* You can try out your code online in the [Ramda REPL](https://ramdajs.com/repl/?v=0.26.1#?).  You can write _FFS Script_ style code for the most part, don't worry about using `R.` as a prefix.

# Contributing

Want to contribute?  Great!  All PRs gratefully recieved.

License
----

MIT
