for (let i = 1; i <= 100; i++) {
    if (i % 3 === 0 && i % 5 === 0) {
        console.log("FizzBuzz");
    } else if (i % 3 === 0) {
        console.log("Fizz");
    } else if (i % 5 === 0) {
        console.log("Buzz");
    } else {
        console.log(i);
   }
}
































// 1. Found on stack overflow, could be better x2, use it as a yardstick
// 2. What's in there...
// 3. Coding workshop in the Guardian
// 4. Post increment operator
// 5. For statement
// 6. For loop is weird, natural and normal to us.  It's macro statement, changed gears into a macro language
// 7. Quora
// 8. Wierdness, complexity, that's why FizzBuzz is a good coding question.  It's test of knowledge rather than proficiency


    // Modulus operator and a logical operator and strict equality operators
    // ^ weird things here:
    // The for statement is like a function or method call but the parameters are separated by
    // semi colons rather than commas.  And the parameters themselves are expressions that are
    // evaluated at different times.
    // You need to know about, assignment, mutable declarations, numerical comparison operators
    // and how to increment a value.

// This is why Fizz Buzz is used as a interview test because you actually have to know quite a bit
// about your programming language to be able to do it.
// It's not really about programming proficiency but more a test of do you know enough about the
// the language to be proficient.

// Look again at this with fresh eyes.
// The for statement is actually quite wierd.  It's like a statement but what is passed to it
// as "arguments" is not separated by commas, the "arguments" are separated by semi-colons.
// It looks like there are three consecutive lines of codes in there.  The lines of code aren't
// evaluated now like they would be for a normal statement, the lines of code are frozen to be
// evaluated later, and I say evaluated but two of the three "arguments" they are run rather than
// evaluated, that's why you can get away with i++.
// You've got expressions in the for statement that are evaluated at different times, and in some
// cases the return value of those expresssions are not consulted (that's why i++ works).
// const j = i++; <-- this is very odd because i++ seems to introduce a strange new phase of
// time.

// Quora question: Why is the for loop so strange?  Lowest ranked answer is one that says "it's like a macro, yeah".
// https://www.quora.com/Why-is-the-for-loop-in-C-so-weird

// My son went to a programming and journalism workshop at The Guardian.  I asked him what he learned,
// he said they showed me "the for statement and the post increment operator".  On one hand, these
// are fundamentals but on the other hand what you learn doesn't really generalise to the rest of the
// language, there's nothing else like the for statement, and there's nothing else like the post
// increment operator.