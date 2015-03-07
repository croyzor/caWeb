Starts a webserver at on port 5000 which, given localhost:5000/01010110 returns the 1D continuous automaton defined by the rule 01010110.

This isn't really useful for anything. Even if it were useful to generate CAs for defined rules, serving them like this doesn't add anything.

Also, when I use this, I always use `curl`. This doesn't really work unless you're viewing it with a monospace font, like in a terminal.

Rules.hs is a library which also allows for using this utility on the command line, with the `main` function taking arguments of how many lines to print then the rule to use and to gradually printing the evolutions.
