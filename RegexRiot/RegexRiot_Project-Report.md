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

One solution to make regex building and management easier includes the magic-regexp library which simplifies regex into separate blocks that can break down the expression into separate groups, which one can define as subgroups. Below is an example which demonstrates how a regex for a phone number can be made with magic-regexp.

```javascript
const NEW_PHONE_RE = createRegExp(
  (exactly('+')
    .optionally()
    .and('1')
    .as('country')
    .optionally()
    .and(charIn(' -').optionally())
    .and((charIn('123456789').and(digit.times(3))).as('area'))
    .and((charIn('123456789').and(digit.times(6))).as('rest'))
    ).at.lineEnd().at.lineStart()
);
```

With that in mind, RegexRiot is a java library heavily inspired from magic-regexp that contains several objects, at the core of which is a RiotString object. This particular RiotString object is an immutable object that behaves in an append-only fashion. However, modified copies can be made which will be covered in more detail in **Design** and **Implementation**.

## Design

_This section should focus on the design of your utility library. You could include information on the design patterns and principles you used, the architecture of your library, and any relevant UML diagrams._

The most important features of RegexRiot were specified as follows:

1. Chain of function calls: The library will provide a chain of function calls that will allow developers to construct regular expressions by describing the pattern they want to match. This approach will make it easy for developers to create complex regular expressions without the need for extensive knowledge of the underlying syntax.

2. Intuitive syntax: The library will use an intuitive syntax that will make it easy for developers to understand and use regular expressions. The syntax will be designed to be easy to read and will provide a clear description of the pattern to match.

3. Support for Java and Kotlin: The library will be developed for Java developers. This will provide a solution for developers working with these languages who are looking for an easy-to-use regular expression library.

4. Wide range of functionalities: The library will provide a wide range of functionalities for pattern matching, including capturing groups, non-capturing groups, character classes, quantifiers, and more. This will provide developers with a powerful tool for working with text data.


## Implementation

_In this section, describe how you implemented your utility library in Java. You could discuss any notable coding decisions you made, how you organized your code, and any interesting algorithms or data structures you used._

## Usage

_Provide instructions on how to use your utility library. This could include code examples and explanations of the library's API._

## Testing

_Describe how you tested your utility library. You could include information on any testing frameworks you used, the types of tests you conducted, and the results of your tests._

Testing was largely conducted with the help of a website known as regextutorials, which contain both tutorials and practice exercises on how to make JavaScript Regex, which helps to understand some of the decisions made for the magic-regexp library 

Below is one example of 

```java
answer = "^.+\\((19[0-8]\\d|\\d{3}|\\d{2}|\\d)\\)";
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

## Future Work

_Conclude your report with a discussion of potential future work for your utility library. This could include new features, bug fixes, or improvements to existing functionality._

RegexRiot has been released as a `.jar` package that is immediately available on GitHub. Future releases may be present in the form of a Maven project, or a different 


## From Proposal: Body of Proposed Work

The proposed work involved developing a Java library called RegexRiot, which provides a simple and intuitive way of constructing regular expressions. The library will be designed to be easy to use and will provide a wide range of functionalities for pattern matching. The following are the key features of the library:

The development of the library will involve the following steps:

1. Research: The first step will be to research existing regular expression libraries for Java and Kotlin. This will help us identify the strengths and weaknesses of existing solutions and provide insights into what functionalities are most needed by developers.
2. Design: Based on our research, we will design the library, including the syntax and chain of function calls. We will also identify the key functionalities that the library will provide.
3. Implementation: Once we have designed the library, we will implement it in Java and Kotlin. We will use test-driven development to ensure that the library is robust and free of bugs.
4. Documentation: We will provide comprehensive documentation for the library, including usage examples and a user manual. This will help developers understand how to use the library and make the most of its functionalities.
5. Release: Once the library is complete, we will release it to the Java and Kotlin communities. We will also promote it on social media and developer forums to ensure that it reaches a wide audience.

## References

1. Oracle. "Java Regular Expressions." Accessed February 27, 2023. https://docs.oracle.com/javase/7/docs/api/java/util/regex/Pattern.html.
2. Kotlin. "Kotlin Regular Expressions." Accessed February 27, 2023. (https://kotlinlang.org/docs/regexp.html)
3. D. Roe, “RegEXP for JavaScript,” magic-regexp, Jul. 16, 2022. https://regexp.dev/ (accessed Feb. 23, 2023).
