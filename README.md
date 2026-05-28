# HiveSymbols
Apple includes a pretty extensive list of symbols in its platforms. My problem with this is they're accessed with a string. The strings can't be checked at compile time, and some of them contain things the macOS spell checker you can use within Xcode considers spelling errors.

So I created HiveSymbols.

## Use
First, add the package.

In your source, import the Symbol enum:

    import enum HiveSymbols.Symbol

Now instead of writing this:

    Image(systemName: "trash")

You can write this:

    Image(symbol: .trash)

## Renames
Many of the symbol names have minimal spelling changes, such as:

    case soccerBall = "soccerball"

Here, you'd use .soccerBall instead of .soccerball. The reasoning is simple: hte macOS spell chcker doesn't recognize soccerball as a word. If we add the capital B, it will instead look up soccer and ball. No spelling problem!

## License
I've used the most permissive license I could find, The Unlicense. Suggestions and patches are welcomed, as long as they fit in the small scope of this project.
