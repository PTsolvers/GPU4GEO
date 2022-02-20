+++
using Dates

title = "Emoji Support"
date  = DateTime(2019, 3, 5)
reading_time = "One-minute read"

tags = ["markdown", "text", "emoji"]
+++

Emojis are supported out of the box in Franklin. You can either copy paste emojis in your source code or use a shorthand such as `:+1:`: :+1:.

The [Emoji cheat sheet](http://www.emoji-cheat-sheet.com/) is a useful reference for emoji shorthand codes.

The dictionary for emojis that is used is Julia's `emoji_symbols` which may not contain all emojis (it should contain most though), you can check whether an emoji is present in your REPL with

```!
using REPL.REPLCompletions: emoji_symbols
println(get(emoji_symbols, "\\:+1:", "not found"))
println(get(emoji_symbols, "\\:dragon_face:", "not found"))
```



***

**N.B.** Franklin supports Unicode Standard emoji characters, however the rendering of these glyphs depends on the browser and the platform.
Make sure you select your [font-stack](https://css-tricks.com/snippets/css/system-font-stack/) appropriately.
