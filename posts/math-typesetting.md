+++
using Dates

title = "Math Typesetting"
date  = DateTime(2019, 3, 8)
reading_time = "One-minute read"

tags = ["markdown", "text", "math"]
+++

Mathematical notation in a Franklin project are supported out of the box with [KaTeX](https://katex.org/).

**Note:** Use the online reference of [Supported TeX Functions](https://katex.org/docs/supported.html).

### Examples

Inline math: $ \varphi = \dfrac{1+\sqrt5}{2}= 1.6180339887…$

Block math:

$$
 \varphi = 1+\frac{1} {1+\frac{1} {1+\frac{1} {1+\cdots} } }
$$
