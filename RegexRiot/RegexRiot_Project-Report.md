# RegexRiot: A Java Library for Building Regular Expressions

**Authors:** Rahul Kandekar and Diego Cruz
**Project Advisor:** Saptarshi Sengupta
**Affiliations:** Department of Computer Science, San Jose State University  
**Keywords:** Regular Expressions, Java, Kotlin, JavaScript, Library, Pattern Matching, Parsing

## Abstract

Regular expressions are essential tools for developers working with text data. However, constructing regular expressions can be a tedious and error-prone task when dealing with longform string literals. To simplify this process for Java/Kotlin developers, we have developed a Java library called RegexRiot. The library offers a straightforward and intuitive way of constructing regular expressions by using a chain of function calls that describe the pattern to match. While similar projects exist for JavaScript, there is a lack of such libraries for Java/Kotlin. This project aims to bridge this gap and provide a solution for developers working with Java/Kotlin.

## Introduction

_Begin your report by introducing your utility library and providing some background on why you decided to create it. This could include a brief overview of the problem your library is designed to solve and any existing solutions you found._

When creating regex expressions, developers will often have a hard time with keeping track of exactly what parts of the regex expression accomplish which tasks. For example, keeping track of number ranges, such as the years 1899 up to 1991, inclusive, can become complicated as the range will include several or-blocks that will then cause the regex expression to fill the line and possibly go on longer than what fits on the screen, or cause a long word wrapping which can bloat the regex. In both cases, if the programmer leaves the code as is, then comes back to it later to modify it for some reason, there is a problem where the developer will likely have to spend time rereading the regex expression to understand it again if the documentation was not put into place at the time.

One solution to make regex building and management easier includes the `magic-regexp` library which simplifies regex into separate blocks that can break down the expression into separate groups, which one can define as subgroups. `magic-regexp` was made as an alternative to the native JavaScript object `RegExp`. Below is an example which demonstrates how a regex for a phone number can be made with magic-regexp.

```javascript
const NEW_PHONE_RE = createRegExp(
  exactly("+")
    .optionally()
    .and("1")
    .as("country")
    .optionally()
    .and(charIn(" -").optionally())
    .and(charIn("123456789").and(digit.times(3)).as("area"))
    .and(charIn("123456789").and(digit.times(6)).as("rest"))
    .at.lineEnd()
    .at.lineStart()
);
```

Unfortunately, such a solution does not currently exist, or is otherwise not widely adopted among the Java programming community. With that in mind, RegexRiot is a Java library heavily inspired from `magic-regexp` that contains several objects, at the core of which is a RiotString object. This particular RiotString object is an immutable object that behaves in an append-only fashion. However, modified copies can be made which will be covered in more detail in **Design** and **Implementation**.

## Design

_This section should focus on the design of your utility library. You could include information on the design patterns and principles you used, the architecture of your library, and any relevant UML diagrams._

The most important features of RegexRiot when conducting research and designing the library were specified as follows:

1. Chain of function calls: The library will provide a chain of function calls that will allow developers to construct regular expressions by describing the pattern they want to match. This approach will make it easy for developers to create complex regular expressions without the need for extensive knowledge of the underlying syntax.

2. Intuitive syntax: The library will use an intuitive syntax that will make it easy for developers to understand and use regular expressions. The syntax will be designed to be easy to read and will provide a clear description of the pattern to match.

3. Support for Java and Kotlin: The library will be developed for Java developers. This will provide a solution for developers working with these languages who are looking for an easy-to-use regular expression library.

4. Wide range of functionalities: The library will provide a wide range of functionalities for pattern matching, including capturing groups, non-capturing groups, character classes, quantifiers, and more. This will provide developers with a powerful tool for working with text data.

With those aforementioned features taken into account, below are some UML diagrams that depict the overall architecture of RegexRiot.

<!-- Insert Images Here -->

RegexRiot is heavily inspired by the `magix-regexp` library, and as such, follows both the imperative and declarative programming paradigms. RegexRiot follows the imperative programming in that it is based around calling functions to build individual components of the expression, which can then be used to construct an overall group that is a larger chunk of the master expression. With respect to the declarative paradigm, RegexRiot follows in the steps of `magic-regexp` in that it provides a simpler and more readable syntax for the creation and maintenance of regex.

## Implementation

_In this section, describe how you implemented your utility library in Java. You could discuss any notable coding decisions you made, how you organized your code, and any interesting algorithms or data structures you used._

The implementation of RegexRiot heavily depends on the usage of tokens to denote specific primitives such as characters, integers, floats, etc. This was an important coding decision in the context of the

In the following example code, two classes which outlines the tokens that can be used in conjunction with the RiotString.

```java
public class RiotTokens {
    public static final RiotString DIGIT = riot("\\d", true),
            DOT = riot("\\.", true),
            ANY_CHAR = riot(".", true),
            WORD_CHAR = riot("\\w", true),
            OPEN_BRACKET = riot("\\(", true),
            CLOSE_BRACKET = riot("\\)", true),
            LINE_START = riot("^", false),
            Line_END = riot("$", false),
            EMPTY = riot(emptyBasicRiotString());
}

class SimpleRiotTokens {
    public static SimpleRiotString DIGIT() {
        return new BasicRiotString("\\d", true);
    }

    public static SimpleRiotString DOT() {
        return new BasicRiotString("\\.", true);
    }

    public static SimpleRiotString ANY_CHAR() {
        return new BasicRiotString(".", true);
    }

    public static SimpleRiotString WORD_CHAR() {
        return new BasicRiotString("\\w", true);
    }

    public static SimpleRiotString QUESTION_CHAR() {
        return new BasicRiotString("\\?", true);
    }

    public static SimpleRiotString EMPTY() {
        return emptyBasicRiotString();
    }
}
```

## Usage

_Provide instructions on how to use your utility library. This could include code examples and explanations of the library's API._

## Testing

_Describe how you tested your utility library. You could include information on any testing frameworks you used, the types of tests you conducted, and the results of your tests._

Testing was largely conducted with the help of a website known as regextutorials [regextutorials.com], which contain both tutorials and practice exercises on how to make JavaScript Regex, which helps to understand some of the decisions made for the magic-regexp library during its implementation.

In the following examples, modifications would have to be made such that the double backslash `\\` would be reduced to a single backslash `\` to be an acceptable regex expression in JavaScript when verifying the output on [regextutorials.com].

Below is an example of how RegexRiot would generate a regex expression to match numbers that contain a floating point as per [regextutorials.com](http://regextutorials.com/excercise.html?Floating%20point%20numbers).

```java
        answer = "\\d+\\.\\d+"; // What RegexRiot would generate
        ritex = oneOrMore(DIGIT).and(DOT).and(oneOrMore(DIGIT));
```

Below is an example of how RegexRiot would generate a regex expression to match the titles of all films produced before 1990 as per the regextutorials website [regextutorials.com](http://regextutorials.com/excercise.html?Years%20before%201990).

```java
answer = "^.+\\((19[0-8]\\d|\\d{3}|\\d{2}|\\d)\\)"; // What RegexRiot would generate
ritex = LINE_START.and(oneOrMore(ANY_CHAR))
        .and(OPEN_BRACKET)
        .and(
                riot("19").and(
                        chars('0').through('8')
                ).and(DIGIT).or(
                        DIGIT.times(3)
                ).or(
                        DIGIT.times(2)
                ).or(
                        DIGIT
                ).wholeThingGrouped()
        )
        .and(CLOSE_BRACKET);
```

Below is an example of how RegexRiot would generate a regex expression to match the 12 and 24 bit colors whose red/green/blue components are equal to each other as per the regextutorials website [regextutorials.com](http://regextutorials.com/excercise.html?Grayscale%20colors).

```java
        answer = "#((\\d|[A-F]|[a-f]){1,2})\\1{2}";
        ritex = riot("#")
                .and(
                        DIGIT.or(
                                chars('A').through('F').toRiotString()
                        ).or(
                                chars('a').through('f').toRiotString()
                        )
                ).times(1, 2)
                .grouped()
                .and(group(1))
                .times(2);
```

## Future Work and Concluding Statements

_Conclude your report with a discussion of potential future work for your utility library. This could include new features, bug fixes, or improvements to existing functionality._

RegexRiot has been released as a `.jar` package that is immediately available on GitHub along with the entirety of the source code which prospective users can download and build on their local machines.

Future releases may be present in the form of a public Maven repository, or an entirely different approach can be used and perhaps a package manager could be made. However, it remains to be seen whether a package manager would be necessary for a library of such scope.

RegexRiot is an open-source software, and as such, we invite others to build it from source, and contribute to improve upon it.
