# Comment Remover in Lex


This is a project written for a course assignment for the course COP290. The main function of this program is to remove comments from a "C" code file.
This is written in lex but without the state syntax, it only uses regexp pattern matching to do it's work.

##Following are the features of the program
1. Remove single line comments beginning with "\\" and replace those characters with a space character.
2. Remove multi line comments beginning with "/*" and ending with "*/" while preserving the line ordering ie printing a newline where there is one in the multiline comment.
3. Be mindful of quotes and escape characters in quotes, so we don't treat the comment beginning and ending tokens as signalling a comment when they are in a quote. Also be mindful of odd and even number of escaping characters , for example - `"abc \\" /*this will be removed */ "av" ` and ` "abc \" /*this will not be removed */ "av" `.
4. Return EXIT_FAILURE and write "Unmatched comment" to err if there is a multiline comment opening token but no corresponding multiline comment ending token.` 

This program uses five regexps which are reproduced below
- `\"([^\\\"\n]|((\\)+[^\\\"])|(\\(\\\\)*\"))*(\\\\)*\"` matches quoted stuff and takes care of escaped characters.
- `\/\/([^\n])* ` matches single line comments.
- `\/\*([^\*]|[\n\r]|(\*+([^\*\/]|[\n\r])))*(\*)+\/` matches multi-line comments (since there is no non-greedy matching in lex I use a hack found on [http://blog.ostermiller.org/find-comment](http://blog.ostermiller.org/find-comment) to achieve the same effect.
- `(\/\*([^\/\*]|\n|(\*+[^\/])|([^\*]\/))*)` matches an unterminated multi-line comment.
- ` . ` matches everything else

